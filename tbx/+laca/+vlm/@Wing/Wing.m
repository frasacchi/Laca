classdef Wing
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties%(SetAccess = protected,GetAccess=public)
        Sections;
        ControlSurfaces;
    end
    properties(GetAccess = private)
        NPanels_hid;
        NNodes_hid;
        Centroid_hid;
    end
    
    properties(Dependent)
       NPanels
       NNodes
       Centroid
       Normal
       Panels
       Nodes
       isTE
       isLE
       Area
       Normalwash
    end
    % results
    properties
        Name = '';
        HasResult = false;
        Gamma; 
        V;
        L;
        F;
        Lprime;
        P;
        Cp; 
        PanelChord;
        PanelSpan;
        Connectivity;
    end
    
    %dependent properties
    methods
        function val = get.NPanels(obj)
            val = obj.NPanels_hid;
        end
        function val = get.NNodes(obj)
            val = obj.NNodes_hid;
        end
        function val = get.Connectivity(obj)
           val = cat(2,obj.Sections.Connectivity);
           np = [obj.Sections.NPanels];
           idx = cumsum([0,[obj.Sections.NPanels]]);
           for i = 1:length(np)
               val(:,idx(i)+1:idx(i+1)) = val(:,idx(i)+1:idx(i+1)) + ...
                   repmat(idx(i),4,np(i));
           end
        end
        function val = get.PanelChord(obj)
            val = cat(1,obj.Sections.PanelChord);
        end
        function val = get.PanelSpan(obj)
            val = cat(1,obj.Sections.PanelSpan);
        end
        function val = get.Centroid(obj)
            val = obj.Centroid_hid;
        end
        function val = get.Panels(obj)
            val = cat(2,obj.Sections.Panels);
            np = [obj.Sections.NPanels];
            node_idx = cumsum([0,[obj.Sections.NNodes]]);
            idx = cumsum([0,[obj.Sections.NPanels]]);
            for i = 1:length(np)
                val(:,idx(i)+1:idx(i+1)) = val(:,idx(i)+1:idx(i+1)) + ...
                   repmat(node_idx(i),4,np(i));
            end
        end
        function val = get.Nodes(obj)
            val = cat(2,obj.Sections.Nodes);
            for i = 1:length(obj.ControlSurfaces)
                if ~strcmp(obj.ControlSurfaces.Name,'None') && obj.ControlSurfaces.Deflection ~= 0
                    h_nodes = obj.ControlSurfaces(i).HingeNodes;
                    hinge = val(:,h_nodes(2))-val(:,h_nodes(1));
                    cs_nodes = obj.ControlSurfaces.Nodes;
                    origin = repmat(val(:,h_nodes(1)),1,length(cs_nodes));
                    val(:,cs_nodes) = origin + farg.geom.rotateAbout(...
                        val(:,cs_nodes)-origin,repmat(hinge,1,length(cs_nodes)),...
                        obj.ControlSurfaces.Deflection);
                end
            end
        end
        function val = get.Normal(obj)
            val = [obj.Sections.Normal];
        end
        function val = get.isTE(obj)
            val = cat(1,obj.Sections.isTE);
        end
        function val = get.isLE(obj)
            val = cat(1,obj.Sections.isLE);
        end
        function val = get.Area(obj)
            val = cat(1,obj.Sections.Area);
        end
        function val = get.Normalwash(obj)
            val = cat(1,obj.Sections.Normalwash);
        end
    end
    
    methods
        function obj = Stitch(obj)
            for i = 1:length(obj.Sections)-1
                % get rhs panels
                sec_lhs = obj.Sections(i);
                con_lhs = sec_lhs.Connectivity;
                lhs_idx = find(isnan(con_lhs(2,:)));
                N_lhs = size(con_lhs,2);
                
                % get lhs panels
                sec_rhs = obj.Sections(i+1);
                con_rhs = sec_rhs.Connectivity;
                rhs_idx = find(isnan(con_rhs(4,:)));
                
                %stitch together lhs and rhs
                for j = 1:length(lhs_idx)
                    con_lhs(2,lhs_idx(j)) = N_lhs + rhs_idx(j);
                    con_rhs(4,rhs_idx(j)) = lhs_idx(j) - N_lhs - 1;
                end
                
                obj.Sections(i+1).Connectivity = con_rhs;
                obj.Sections(i).Connectivity = con_lhs;
            end
        end
    end
    
    
    % apply results
    methods
        function obj = apply_result(obj,gamma,V,rho)
            obj.Gamma = gamma;
            obj.V = V;
            obj.L = obj.Lift(rho);
            area = obj.Area;
            obj.Lprime = obj.L./area;
            obj.P = obj.L./area;
            obj.Cp = obj.P./(0.5*rho*vecnorm(V(obj.Centroid)).^2)';
        end
        function L = Lift(obj,rho)
           L = rho .* vecnorm(obj.V(obj.Centroid))' .* obj.PanelSpan;
%            L = zeros(size(L));
%            norm_v = obj.V(obj.Centroid);
%            norm_v = norm_v - dot(norm_v,obj.PanelNormal).*obj.PanelNormal;
           Con = obj.Connectivity;           
           for i = 1:obj.NPanels
%                for j = 1:1
%                   if ~isnan(Con(j,i))
%                       L(i) = L(i).*(obj.Gamma(i)-obj.Gamma(Con(j,i)));
%                   elseif j == 1
%                       L(i) = L(i).*obj.Gamma(i);
%                   end  
%                end
               for j = 1:1
                  if ~isnan(Con(j,i))
                      L(i) = L(i).*(obj.Gamma(i)-obj.Gamma(Con(j,i)));
                  elseif j == 1
                      L(i) = L(i).*obj.Gamma(i);
                  end  
               end
           end           
        end
        
    end
    
    methods  
        function obj = Wing(Sections,varargin)           
            obj.Sections = Sections;
            obj.NPanels_hid = sum([obj.Sections.NPanels]);
            obj.Centroid_hid = [obj.Sections.Centroid];
            obj.NNodes_hid = sum([obj.Sections.NNodes]);
        end   
        
    end
    methods(Static)
        function obj = From_laca_wing(lacaWing,minSpan,NChord,ignoreControlSurf)
            sections = laca.vlm.Section.empty;
            for i = 1:length(lacaWing.WingSections)
                sections(end+1) = laca.vlm.Section.From_laca_section(...
                    lacaWing.WingSections(i),minSpan,NChord,...
                    ignoreControlSurf);
            end
            obj = laca.vlm.Wing(sections);
        end
        function obj = From_LE_TE(LE,TE,NChord)
            obj = laca.vlm.Section.From_LE_TE(LE,TE,NChord);
        end
    end
end

