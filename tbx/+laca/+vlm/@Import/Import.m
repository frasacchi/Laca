classdef Import < laca.vlm.Base
    %CONTROLSURFACE Summary of this class goes here
    %   Detailed explanation goes here

    properties
        EtaVector = [0;0;0]
        Chord;
        Anchor = [0;0;0]
        Components = {}
        Name = ''
    end

    methods
        function obj = Import(in,opts)
            arguments
                in = []
                opts.ImportMethod (1,1) string {mustBeMember(opts.ImportMethod, ["baff2vlm", "fe2vlm"])} = "baff2vlm"
            end

            if ~isempty(in)
                if opts.ImportMethod == "baff2vlm"
                    obj = obj.baff2vlm(in);
                elseif opts.ImportMethod == "fe2vlm"
                    obj = obj.fe2vlm(in);
                end
            end
        end

        function [obj,flag] = baff2vlm(obj, baff)
            arguments
                obj
                baff
            end

            obj.Name = baff.Name;
            flag = false;

            if isa(baff, 'baff.Wing') || isa(baff,'baff.DraggableWing')
                obj.EtaVector = cumsum(baff.EtaLength*(baff.Stations.Eta(2:end)-baff.Stations.Eta(1:end-1)).*baff.Stations.EtaDir(:,1:end-1),2);
                obj.Chord = baff.AeroStations.Chord;
                obj.Anchor = obj.EtaVector(:,end);
                flag = true;
            end

            %generate obj.Components for Children
            for i = 1:length(baff.Children)
                child = laca.vlm.Import();
                [obj_comp,f] = child.baff2vlm(baff.Children(i));
                
                if f || ~isempty(obj_comp.Components)
                    obj_comp.EtaVector = obj.Anchor + obj_comp.EtaVector; %TODO - FIX IF EtaVector is empty!
                    obj_comp.Anchor = obj_comp.EtaVector(:,end);
                    obj.Components{end+1} = obj_comp;
                end
            end
        end

        function obj = fe2vlm(obj, fe)
            arguments
                obj
                fe
            end

            j=1;
            i=1;
            while i <= length(fe.AeroSurfaces)
                obj.Components{j}.Name = fe.AeroSurfaces(i).Tag;
                ai=1;
                while i <= length(fe.AeroSurfaces) && strcmp(obj.Components{j}.Name, fe.AeroSurfaces(i).Tag)
                    AeroSurface = fe.AeroSurfaces(i);
                    origin = laca.vlm.Import.get_origin(AeroSurface.CoordSys);
                    AeroPoints(:,:,ai) = AeroSurface.Points + origin;
                    Chords(:,:,ai) = AeroSurface.Chords';
                    i=i+1;
                    ai=ai+1;
                end
                obj.Components{j}.EtaVector = [AeroPoints(:, 1, 1), squeeze(AeroPoints(:, 2, :))];
                obj.Components{j}.Chord = [Chords(:, 1, 1); squeeze(Chords(:, 2, :))]';
                j=j+1;
                AeroPoints = [];
                Chords = [];
            end
        end

        function obj = Flatten(obj)
            if isempty(obj.Components)
                return; % Nothing to flatten
            end
            
            tmpComponents = obj.Components;
            obj.Components = {}; % Clear components
            
            for i = 1:length(tmpComponents)
                flat_child = tmpComponents{i}.Flatten();
                obj = obj + flat_child;
            end
        end

        % Overload the + operator for merging Import objects
        function obj = plus(obj1, obj2)
            % The result will be stored in obj1
            obj = obj1;
            
            % Aggregate EtaVector
            obj.EtaVector = [obj.EtaVector, obj2.EtaVector];
            obj.Chord = [obj.Chord ,obj2.Chord];
            
            % Aggregate Components (add obj2 itself and its components)
            obj.Components = [obj.Components, obj2.Components];
            obj2.Components = {}; % Avoid nesting
            obj.Components{end+1} = obj2;
        end
    end

    methods(Static)
        function origin = get_origin(CoordSys)
            if ~isempty(CoordSys)
                origin = CoordSys.A*CoordSys.Origin;
            else
                origin = [0;0;0];
                return
            end

            origin = origin + laca.vlm.Import.get_origin(CoordSys.InputCoordSys);

        end
    end
    
end