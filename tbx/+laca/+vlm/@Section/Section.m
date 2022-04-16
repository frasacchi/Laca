classdef Section
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here

    properties
        base_panels;
        base_nodes;
        Normalwash;
    end

    properties
        isTE = [];
        isLE = [];
        Connectivity;
        Name = '';
        ControlSurfaces = laca.vlm.ControlSurface.empty;
    end

    properties(Dependent)
        Panels;
        Nodes;
        NPanels;
        NNodes;
        Centroid;
        Midpoint;
        PanelChord;
        PanelSpan;
        Normal;
        Area;
    end

    methods
        function val = get.Panels(obj)
            val = obj.base_panels;
        end
        function val = get.Nodes(obj)
            val = obj.base_nodes;
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
        function val = get.NPanels(obj)
            val = size(obj.base_panels,2);
        end
        function val = get.NNodes(obj)
            val = size(obj.base_nodes,2);
        end
        function out = get.Centroid(obj)
            out = reshape(sum(reshape(obj.Nodes(:,obj.Panels(:)),3,4,[]),2),3,[])./4;
        end
        function out = get.Midpoint(obj)
            out = zeros(3,2,obj.NPanels);
            out(:,1,:) = reshape(sum(reshape(obj.Nodes(:,obj.Panels(1:2,:)),3,2,[]),2),3,[])./2;
            out(:,2,:) = reshape(sum(reshape(obj.Nodes(:,obj.Panels(3:4,:)),3,2,[]),2),3,[])./2;
        end
        function out = get.PanelChord(obj)
            N = reshape(sum(reshape(obj.Nodes(:,obj.Panels(1:2,:)),3,2,[]),2),3,[])./2;
            S = reshape(sum(reshape(obj.Nodes(:,obj.Panels(3:4,:)),3,2,[]),2),3,[])./2;
            out = vecnorm(S-N)';
        end
        function out = get.PanelSpan(obj)
            E = reshape(sum(reshape(obj.Nodes(:,obj.Panels([1,4],:)),3,2,[]),2),3,[])./2;
            W = reshape(sum(reshape(obj.Nodes(:,obj.Panels(2:3,:)),3,2,[]),2),3,[])./2;
            out = vecnorm(E-W)';
        end
        function out = get.Normal(obj)
            %get the four cardinal points of the box
            A = obj.Nodes(:,obj.Panels(1,:));
            B = obj.Nodes(:,obj.Panels(2,:));
            C = obj.Nodes(:,obj.Panels(3,:));
            D = obj.Nodes(:,obj.Panels(4,:));
            out = cross(C-A,B-D);
            out = out ./ vecnorm(out);
        end
        function area = get.Area(obj)
            A = obj.Nodes(:,obj.Panels(1,:));
            B = obj.Nodes(:,obj.Panels(2,:));
            C = obj.Nodes(:,obj.Panels(3,:));
            D = obj.Nodes(:,obj.Panels(4,:));
            area = 0.5*(vecnorm(cross(B-A,D-A)) + vecnorm(cross(B-C,D-C)))';
        end
        function obj = Section(Panels,Nodes,isLE,isTE,Connectivity)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.base_panels = Panels;
            obj.base_nodes = Nodes;
            obj.isLE = isLE;
            obj.isTE = isTE;
            obj.Connectivity = Connectivity;
        end
    end
    methods(Static)
        obj = From_laca_section(wingSection,minSpan,NChord,ignoreControlSurf);
        obj = From_LE_TE(LE,TE,chord_eta_LHS,chord_eta_RHS,NControl,ControlDeflection,NormalWash);
    end
end


