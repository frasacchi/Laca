classdef Section
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Panels;
        Normalwash;
    end
    
    properties
        isTE = [];
        isLE = [];
        Connectivity;
        Name = '';
    end
    
    properties(Dependent)
       NPanels; 
       Centroid;
       Midpoint;
       PanelChord;
       PanelSpan;
       Normal;
       Area;
    end
    
    methods
        
        function val = get.NPanels(obj)
           val = size(obj.Panels,3);
        end
        function out = get.Centroid(obj)
            out = reshape(sum(obj.Panels,1)./4,3,[]);
        end
        function out = get.Midpoint(obj)
            out = zeros(2,3,obj.NPanels);
            out(1,:,:) = (obj.Panels(2,:,:)+obj.Panels(1,:,:))./2; 
            out(2,:,:) = (obj.Panels(3,:,:)+obj.Panels(4,:,:))./2; 
        end
        function out = get.PanelChord(obj)
            N = reshape((obj.Panels(1,:,:)+obj.Panels(2,:,:))./2,3,[]);
            S = reshape((obj.Panels(3,:,:)+obj.Panels(4,:,:))./2,3,[]);
            out = vecnorm(S-N)';
        end
        function out = get.PanelSpan(obj)
            E = reshape((obj.Panels(2,2:3,:)+obj.Panels(3,2:3,:))./2,2,[]);
            W = reshape((obj.Panels(4,2:3,:)+obj.Panels(1,2:3,:))./2,2,[]);
            out = vecnorm(E-W)';
        end
        function out = get.Normal(obj)
            %get the four cardinal points of the box
            N = reshape((obj.Panels(1,:,:)+obj.Panels(2,:,:))./2,3,[]);
            E = reshape((obj.Panels(2,:,:)+obj.Panels(3,:,:))./2,3,[]);
            S = reshape((obj.Panels(3,:,:)+obj.Panels(4,:,:))./2,3,[]);
            W = reshape((obj.Panels(4,:,:)+obj.Panels(1,:,:))./2,3,[]);
            out = cross(S-N,E-W);
            out = out ./ vecnorm(out);
        end
        function area = get.Area(obj)
            A = reshape(obj.Panels(1,:,:,:),3,[]);
            B = reshape(obj.Panels(2,:,:,:),3,[]);
            C = reshape(obj.Panels(3,:,:,:),3,[]);
            D = reshape(obj.Panels(4,:,:,:),3,[]);
            area = 0.5*(vecnorm(cross(B-A,D-A)) + vecnorm(cross(B-C,D-C)))';
        end        
        function obj = Section(Panels,isLE,isTE,Connectivity)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here           
            obj.Panels = Panels;
            obj.isLE = isLE;
            obj.isTE = isTE;
            obj.Connectivity = Connectivity;
        end        
    end
    methods(Static)
        function obj = From_laca_section(wingSection,minSpan,NChord,ignoreControlSurf)
            span = norm(wingSection.LE(:,2)-wingSection.LE(:,1));
            NSpan = ceil(span/minSpan);
            span_eta = linspace(0,1,NSpan+1);
            if ~wingSection.hasControlSurf || ignoreControlSurf
                chord_eta_LHS = linspace(0,1,NChord+1);
                chord_eta_RHS = linspace(0,1,NChord+1);
                NControl = 0;
            else
                chord_eta_LHS = linspace(0,1-wingSection.ControlRefChord(1),NChord+1);
                chord_eta_LHS = [chord_eta_LHS(1:end-1),...
                    linspace(1-wingSection.ControlRefChord(1),1,3)];
                chord_eta_RHS = linspace(0,1-wingSection.ControlRefChord(2),NChord+1);
                chord_eta_RHS = [chord_eta_RHS(1:end-1),...
                    linspace(1-wingSection.ControlRefChord(2),1,3)];
                NChord = NChord + 2;
                NControl = 2;
                HingeLine = wingSection.RefNodes([chord_eta_LHS(end-2),chord_eta_RHS(end-2)]);
            end
            N = NSpan*NChord;
            panels = zeros(4,3,N);
            normalwash_grad = wingSection.Normalwash(2)-wingSection.Normalwash(1);
            normalwash_A = wingSection.Normalwash(1);
            normalwash = zeros(N,1);
            connectivity = ones(4,N)*nan;
            isTE = false(N,1);
            isLE = false(N,1);
            LE = wingSection.LE;
            TE = wingSection.TE;
            LT = TE-LE;
            for j = 1:NChord
                AB = LE+[LT(:,1).*chord_eta_LHS(j),LT(:,2).*chord_eta_RHS(j)];
                DC = LE+[LT(:,1).*chord_eta_LHS(j+1),LT(:,2).*chord_eta_RHS(j+1)];
                AB_dir = AB(:,2)-AB(:,1);
                DC_dir = DC(:,2)-DC(:,1);
                isTE_idx = j == NChord;
                for i = 1:NSpan
                    idx = (j-1)*NSpan + i; 
                    normalwash(idx) = mean(span_eta(i:i+1))*normalwash_grad + normalwash_A;
                    panels(1,:,idx) = (AB(:,1)+AB_dir*span_eta(i))';
                    panels(2,:,idx) = (AB(:,1)+AB_dir*span_eta(i+1))';
                    panels(3,:,idx) = (DC(:,1)+DC_dir*span_eta(i+1))';
                    panels(4,:,idx) = (DC(:,1)+DC_dir*span_eta(i))';
                    if j > 1
                        connectivity(1,idx) = idx - NSpan; 
                    else
                        isLE(idx) = true;
                    end
                    if ~isTE_idx
                        connectivity(3,idx) = idx + NSpan;
                    else
                        isTE(idx,1) = true;
                    end
                    if i > 1
                        connectivity(4,idx) = idx - 1;
                    end
                    if i<NSpan
                        connectivity(2,idx) = idx + 1;                        
                    end
                    if NControl>0 && j>=NChord-NControl+1
                        for k = 1:4
                            panels(k,:,idx)  = HingeLine(:,2)' + ...
                                rotateAbout(panels(k,:,idx)'-HingeLine(:,2),...
                                HingeLine(:,1)-HingeLine(:,2),...
                                wingSection.ControlDeflection)';
                        end
                    end
                end
            end            
            obj = laca.panel.Section(panels,isLE,isTE,connectivity);  
            obj.Name = wingSection.Name;
            obj.Normalwash = normalwash;
        end
    end
end


