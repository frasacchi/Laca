classdef Section
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        base_panels;
        Normalwash;
        deform_panel = @(x)x;
    end
    
    properties
        isTE = [];
        isLE = [];
        Connectivity;
        Name = '';
    end
    
    properties(Dependent)
       Panels;
       NPanels; 
       Centroid;
       Midpoint;
       PanelChord;
       PanelSpan;
       Normal;
       Area;
    end
    
    methods
        function val = get.Panels(obj)
           val = obj.deform_panel(obj.base_panels);
        end
        function val = get.NPanels(obj)
           val = size(obj.base_panels,3);
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
            obj.base_panels = Panels;
            obj.isLE = isLE;
            obj.isTE = isTE;
            obj.Connectivity = Connectivity;
        end        
    end
    methods(Static)
        obj = From_laca_section(wingSection,minSpan,NChord,ignoreControlSurf);
        obj = From_LE_TE(LE,TE,NChord);
    end
end


