classdef Wing < laca.vlm.Base
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here

    properties       
        Filiment_Force;
        Filiment_Position;
        Panel_Filiments;
    end
    properties(SetAccess = immutable)
        NPanels;
        NNodes;
    end
    properties(NonCopyable)
        Sections;
        Panels_cache;
    end
    properties(Dependent)
        dC_l_dalpha
        Centroid
        Normal
        Panels
        Nodes
        isTE
        isLE
        Area
        Normalwash
        Rot;
        R;
        RingNodes;
        Collocation;
        Vbody_func
        Gamma;
        N;
        L;
        D;
        S;
        F;
        Lprime;
        P;
        Cp;
        Cl;
        Cd;
        PanelChord;
        PanelSpan;
        Connectivity;
    end
    % results
    properties
        useMEX = true;
        Name = '';
        HasResult = false;
        
    end
    methods
      function cp = copy(obj)
         % Shallow copy object
         cp = laca.vlm.Wing(arrayfun(@(x)x.copy,[obj.Sections]));
         cp.useMEX = obj.useMEX;
         cp.HasResult = obj.HasResult;
         cp.Name = obj.Name;
         cp.Filiment_Force = obj.Filiment_Force;
         cp.Filiment_Position = obj.Filiment_Position;
         cp.Panel_Filiments = obj.Panel_Filiments;
      end
   end

    %dependent properties
    methods
        function set.Vbody_func(obj,val)
            for i = 1:length(obj.Sections)
                obj.Sections(i).Vbody_func = val;
            end
        end
        function set.Rot(obj,val)
            for i = 1:length(obj.Sections)
                obj.Sections(i).Rot = val;
            end
        end
        function set.R(obj,val)
            for i = 1:length(obj.Sections)
                obj.Sections(i).R = val;
            end
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
            val = cat(2,obj.Sections.Centroid);
        end
        function val = get.Panels(obj)
            if ~isempty(obj.Panels_cache)
                val = obj.Panels_cache;
            else
            val = cat(2,obj.Sections.Panels);
            np = [obj.Sections.NPanels];
            node_idx = cumsum([0,[obj.Sections.NNodes]]);
            idx = cumsum([0,[obj.Sections.NPanels]]);
            for i = 1:length(np)
                val(:,idx(i)+1:idx(i+1)) = val(:,idx(i)+1:idx(i+1)) + ...
                    repmat(node_idx(i),4,np(i));
            end
            obj.Panels_cache = val;
            end
        end
        function val = get.F(obj)
            val = cat(2,obj.Sections.F);
        end
        function val = get.dC_l_dalpha(obj)
            val = cat(1,obj.Sections.dC_l_dalpha);
        end
        function val = get.Gamma(obj)
            val = cat(1,obj.Sections.Gamma);
        end
        function val = get.N(obj)
            val = cat(1,obj.Sections.N);
        end
        function val = get.L(obj)
            val = cat(1,obj.Sections.L);
        end
        function val = get.D(obj)
            val = cat(1,obj.Sections.D);
        end
        function val = get.S(obj)
            val = cat(1,obj.Sections.S);
        end
        function val = get.Lprime(obj)
            val = cat(1,obj.Sections.Lprime);
        end
        function val = get.P(obj)
            val = cat(1,obj.Sections.P);
        end
        function val = get.Cp(obj)
            val = cat(1,obj.Sections.Cp);
        end
        function val = get.Cl(obj)
            val = cat(1,obj.Sections.Cl);
        end
        function val = get.Cd(obj)
            val = cat(1,obj.Sections.Cd);
        end
        function val = get.Nodes(obj)
            val = cat(2,obj.Sections.Nodes);
        end
        function val = get.RingNodes(obj)
            val = cat(2,obj.Sections.RingNodes);
        end
        function val = get.Collocation(obj)
            val = cat(2,obj.Sections.Collocation);
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
        function clearCache(obj)
            obj.Panels_cache = [];
        end
        function val = Vbody(obj,U)
            val = [];
            for i = 1:length(obj.Sections)
                val = [val,obj.Sections(i).Vbody(U)];
            end
        end
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
        function obj = apply_result_katz(obj,gamma,V,rho)
            Lift = -obj.Lift_katz(gamma,V,rho);
            idx = 1;
            for i = 1:length(obj.Sections)
                pN = obj.Sections(i).NPanels;
                obj.Sections(i) = obj.Sections(i).apply_result_katz(...
                    gamma(idx:idx+pN-1),...
                    -Lift(idx:idx+pN-1),V,rho);
                idx = idx + pN;
            end
        end
%         function obj = apply_result_filiment(obj,gamma,Fs,V,rho)
%             idx = 1;
%             for i = 1:length(obj.Sections)
%                 pN = obj.Sections(i).NPanels;
%                 obj.Sections(i) = obj.Sections(i).apply_result(...
%                     gamma(idx:idx+pN-1),...
%                     Fs(:,idx:idx+pN-1),V,rho);
%                 idx = idx + pN;
%             end
%         end
        function L = Lift_katz(obj,gamma,V,rho)
            Vs = V(obj.Centroid);
            L = rho .* vecnorm(Vs)' .* obj.PanelSpan;
            Con = obj.Connectivity;
            for i = 1:obj.NPanels
                for j = 1:1
                    if ~isnan(Con(j,i))
                        L(i) = L(i).*(gamma(i)-gamma(Con(j,i)));
                    elseif j == 1
                        L(i) = L(i).*gamma(i);
                    end
                end
            end
        end
    end

    methods
        function obj = Wing(Sections,varargin)
            obj.Sections = Sections;
            obj.NPanels = sum([obj.Sections.NPanels]);
            obj.NNodes = sum([obj.Sections.NNodes]);
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

