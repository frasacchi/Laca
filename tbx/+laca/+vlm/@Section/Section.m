classdef Section < laca.vlm.Base
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Filiment_Force;
        Panel_Filiments;
        Vbody_func = @(U,X)zeros(size(X));
    end
        properties(GetAccess = protected)
            Nodes_cache;
            Centroid_cache;
            Midpoint_cache;
            Normal_cache;
            RingNodes_cache;
            Collocation_cache;
        end
    properties(SetAccess = immutable)
        base_nodes;
        base_ringNodes;
        base_FilimentPosition;
%         base_collocation;
        base_centroid;
        base_normal;
        Panels;
        NPanels;
        NNodes;
        PanelChord;
        PanelSpan;
        Area;
        isTE;
        isLE;
    end

    properties
        dC_l_dalpha;
        Normalwash;
        Connectivity;
        Name = '';
    end

    properties
        useMEX = true;
        Gamma;
        V;
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
    end

    properties(SetAccess = protected)
        ControlSurfaces_ = laca.vlm.ControlSurface.empty;
        Rot_ = eye(3);
        R_ = zeros(3,1);
    end
    properties(Dependent)
        ControlSurfaces
        Rot
        R
    end

    properties(Dependent)
        Filiment_Position;
        Nodes;
        Centroid;
        Midpoint;
        Normal;
        RingNodes;
        Collocation;
    end
    methods 
        function cp = copy(obj)
            cp = laca.vlm.Section(obj.Panels,obj.base_nodes,...
                obj.isLE,obj.isTE,obj.Connectivity);
            cp.Filiment_Force = obj.Filiment_Force;
            cp.Panel_Filiments = obj.Panel_Filiments;
            cp.Name = obj.Name;
            cp.Normalwash = obj.Normalwash;
            cp.Vbody_func = obj.Vbody_func;
            cp.R_ = obj.R_;
            cp.Rot_ = obj.Rot_;
        end
    end
    methods
        function val = get.ControlSurfaces(obj)
            val = obj.ControlSurfaces_;
        end
        function set.ControlSurfaces(obj,val)
%             obj.ClearCache();
            obj.ControlSurfaces_ = val;
        end
        function val = get.Rot(obj)
            val = obj.Rot_;
        end
        function set.Rot(obj,val)
%             obj.ClearCache();
            obj.Rot_ = val;
        end
        function val = get.R(obj)
            val = obj.R_;
        end
        function set.R(obj,val)
            obj.ClearCache();
            obj.R_ = val;
        end
        function ClearCache(obj)
%             obj.Nodes_cache = [];
%             obj.Centroid_cache = [];
%             obj.Midpoint_cache = [];
%             obj.Normal_cache = [];
%             obj.RingNodes_cache = [];
%             obj.Collocation_cache = [];
        end
    end

    methods
        function val = NodesLocal(obj,val)
            for i = 1:length(obj.ControlSurfaces)
                if ~strcmp(obj.ControlSurfaces.Name,'None') && obj.ControlSurfaces.Deflection ~= 0
                    h_nodes = obj.ControlSurfaces(i).HingeNodes;
                    hinge = obj.base_nodes(:,h_nodes(2))-obj.base_nodes(:,h_nodes(1));
                    cs_nodes = obj.ControlSurfaces.Nodes;
                    origin = repmat(obj.base_nodes(:,h_nodes(1)),1,length(cs_nodes));
                    val(:,cs_nodes) = origin + farg.geom.rotateAbout(...
                        val(:,cs_nodes)-origin,repmat(hinge,1,length(cs_nodes)),...
                        obj.ControlSurfaces.Deflection);
                end
            end
        end
    end

    methods
        function val = Vbody(obj,U)
            local_col = laca.vlm.vlm_C_code('get_collocation',obj.Panels,obj.NodesLocal(obj.base_nodes),obj.dC_l_dalpha);
            val = obj.Vbody_func(U,local_col);
        end
        function val = get.Nodes(obj)
%             if isempty(obj.Nodes_cache)
                val = obj.NodesLocal(obj.base_nodes);
                val = obj.Rot*val + repmat(obj.R,1,size(val,2));
%                 obj.Nodes_cache = val;
%             else
%                 val = obj.Nodes_cache;
%             end
            
        end
        function val = get.RingNodes(obj)
%             if isempty(obj.RingNodes_cache)
                val = obj.NodesLocal(obj.base_ringNodes);
                val = obj.Rot*val + repmat(obj.R,1,size(val,2));
%                 obj.RingNodes_cache = val;
%             else
%                 val = obj.RingNodes_cache;
%             end
        end
        function val = get.Collocation(obj)
            if obj.useMEX
                val = laca.vlm.vlm_C_code('get_collocation',obj.Panels,obj.Nodes,obj.dC_l_dalpha);
            else
                val = laca.vlm.get_collocation(obj.Panels,obj.Nodes,obj.dC_l_dalpha);
            end
            for i = 1:length(obj.ControlSurfaces)
                if ~strcmp(obj.ControlSurfaces.Name,'None') && obj.ControlSurfaces.Deflection ~= 0
                    h_nodes = obj.ControlSurfaces(i).HingeNodes;
                    hinge = obj.base_nodes(:,h_nodes(2))-obj.base_nodes(:,h_nodes(1));
                    cs_nodes = obj.ControlSurfaces.Panels;
                    origin = repmat(obj.base_nodes(:,h_nodes(1)),1,length(cs_nodes));
                    val(:,cs_nodes) = origin + farg.geom.rotateAbout(...
                        val(:,cs_nodes)-origin,repmat(hinge,1,length(cs_nodes)),...
                        obj.ControlSurfaces.Deflection);
                end
            end
%             val = obj.Rot*val + repmat(obj.R,1,size(val,2));
        end
%         function val = get.Collocation(obj)
%             if isempty(obj.Collocation_cache)
%             val = obj.base_collocation;
%             for i = 1:length(obj.ControlSurfaces)
%                 if ~strcmp(obj.ControlSurfaces.Name,'None') && obj.ControlSurfaces.Deflection ~= 0
%                     h_nodes = obj.ControlSurfaces(i).HingeNodes;
%                     hinge = obj.base_nodes(:,h_nodes(2))-obj.base_nodes(:,h_nodes(1));
%                     cs_nodes = obj.ControlSurfaces.Panels;
%                     origin = repmat(obj.base_nodes(:,h_nodes(1)),1,length(cs_nodes));
%                     val(:,cs_nodes) = origin + farg.geom.rotateAbout(...
%                         val(:,cs_nodes)-origin,repmat(hinge,1,length(cs_nodes)),...
%                         obj.ControlSurfaces.Deflection);
%                 end
%             end
%             val = obj.Rot*val + repmat(obj.R,1,size(val,2));
%             obj.Collocation_cache = val;
%             else
%                 val = obj.Collocation_cache;
%             end
%         end
        function val = get.Centroid(obj)
%             if isempty(obj.Centroid_cache)
                val = obj.base_centroid;
                val = obj.Rot*val + repmat(obj.R,1,size(val,2));
%                 obj.Centroid_cache = val;
%             else
%                 val = obj.Centroid_cache;
%             end
        end
        function val = get.Filiment_Position(obj)
%             if isempty(obj.Centroid_cache)
                val = obj.base_FilimentPosition;
                val = obj.Rot*val + repmat(obj.R,1,size(val,2));
%                 obj.Centroid_cache = val;
%             else
%                 val = obj.Centroid_cache;
%             end
        end
        function val = get.Midpoint(obj)
%             if isempty(obj.Midpoint_cache)
                val = zeros(3,2,obj.NPanels);
                val(:,1,:) = reshape(sum(reshape(obj.Nodes(:,obj.Panels(1:2,:)),3,2,[]),2),3,[])./2;
                val(:,2,:) = reshape(sum(reshape(obj.Nodes(:,obj.Panels(3:4,:)),3,2,[]),2),3,[])./2;
%                 obj.Midpoint_cache = val;
%             else
%                 val = obj.Midpoint_cache;
%             end
        end
        function val = get.Normal(obj)
%             if isempty(obj.Normal_cache)
                val = obj.base_normal;
                val = obj.Rot*val;
%                 obj.Normal_cache = val;
%             else
%                 val = obj.Normal_cache;
%             end
        end
        function obj = Section(Panels,Nodes,isLE,isTE,Connectivity)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.Panels = Panels;
            obj.base_nodes = Nodes;
            obj.isLE = isLE;
            obj.isTE = isTE;
            obj.Connectivity = Connectivity;
            obj.NPanels = size(Panels,2);
            obj.NNodes =  size(Nodes,2);
            obj.dC_l_dalpha = 2*pi*ones(obj.NPanels,1);

            N = reshape(sum(reshape(Nodes(:,Panels(1:2,:)),3,2,[]),2),3,[])./2;
            S = reshape(sum(reshape(Nodes(:,Panels(3:4,:)),3,2,[]),2),3,[])./2;
            E = reshape(sum(reshape(Nodes(:,Panels([1,4],:)),3,2,[]),2),3,[])./2;
            W = reshape(sum(reshape(Nodes(:,Panels(2:3,:)),3,2,[]),2),3,[])./2;

            obj.PanelChord = vecnorm(S-N)';
            obj.PanelSpan = vecnorm(E-W)';
            obj.base_centroid = (N+S)./2;
            
            if obj.useMEX
                obj.base_ringNodes= laca.vlm.vlm_C_code('generate_rings',Panels,Nodes);
                obj.base_ringNodes= laca.vlm.vlm_C_code('generate_rings',Panels,Nodes);
                obj.Area = laca.vlm.vlm_C_code('panel_area',Panels,Nodes);
                obj.base_normal = laca.vlm.vlm_C_code('panel_normal',Panels,Nodes);
                obj.base_FilimentPosition = laca.vlm.vlm_C_code('panel_compass',Panels,obj.base_ringNodes);  
            else
                obj.base_ringNodes = laca.vlm.generate_rings(Panels,Nodes);
                obj.Area = laca.vlm.panel_area(Panels,Nodes);
                obj.base_normal = laca.vlm.panel_normal(Panels,Nodes);
                obj.base_FilimentPosition = laca.vlm.panel_compass(Panels,obj.base_ringNodes);  
            end

        end
        function obj = apply_result_katz(obj,gamma,L,V,rho)
            obj.Gamma = gamma;
            obj.V = V;

            A = obj.Nodes(:,obj.Panels(1,:));
            B = obj.Nodes(:,obj.Panels(2,:));
            n = cross(B-A,V(obj.Centroid));
            n = n./vecnorm(n);
            Fs = repmat(L(:)',3,1).*n;
            obj.F = Fs;
            obj.Filiment_Force = [];
            if obj.useMEX
                [obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
                    = laca.vlm.vlm_C_code('apply_result',Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
            else
                [obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
                    = laca.vlm.apply_result(Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
            end
        end
    end
    methods(Static)
        obj = From_laca_section(wingSection,minSpan,NChord,ignoreControlSurf);
        obj = From_LE_TE(LE,TE,chord_eta_LHS,chord_eta_RHS,NControl,ControlDeflection,NormalWash);
    end
end


