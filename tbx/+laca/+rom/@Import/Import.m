classdef Import < laca.rom.Wing
    %CONTROLSURFACE Summary of this class goes here
    %   Detailed explanation goes here

    properties
        EtaVector = [0;0;0]
        Anchor = [0;0;0]
        isELEMENT = false;
        % Children = {}
        % Name = ''
    end

    methods
        function obj = Import(in,opts)
            arguments
                in = []
                opts.ImportMethod (1,1) string {mustBeMember(opts.ImportMethod, ["baff2rom","fe2rom"])} = "baff2rom";
            end

            if ~isempty(in)
                if opts.ImportMethod == "baff2rom"
                    obj = obj.baff2rom(in);
                %  TODO - fe2rom
                % elseif opts.ImportMethod == "fe2rom"
                %     obj = obj.fe2rom(in);
                end
            end
        end

        function [obj,flag] = baff2rom(obj, baff, opts)
            arguments
                obj
                baff
                opts.parentAnchor = obj.Anchor;
            end

            obj.Name = baff.Name;
            flag = false;

            if isa(baff, 'baff.Wing') || isa(baff,'baff.DraggableWing')
                flag = true;
                obj.isELEMENT = true;
                obj.EtaVector = cumsum(baff.EtaLength*(baff.Stations.Eta(2:end)-baff.Stations.Eta(1:end-1)).*baff.Stations.EtaDir(:,1:end-1),2);
                obj.Anchor = obj.EtaVector(:,end) + opts.parentAnchor;
                obj.Inertia = baff.Stations.I;
                obj.Material = baff.Stations.Mat;
                obj.Geometry.Area = baff.Stations.A;
                obj.Geometry.J = baff.Stations.J;
                obj.CoM = baff.GetGlobalCoM;
                
                % TODO - properly handle mass and inertia positions
                for i = 1:length(baff.Children)
                    if isa(baff.Children(i), 'baff.Mass') || isa(baff.Children(i), 'baff.Fuel')
                        obj.BulkMass(end+1) = baff.Children(i).mass;
                    end
                end
            end

            if isa(baff, 'baff.Hinge')
                obj.isELEMENT = true;
                obj.Anchor = opts.parentAnchor;
                obj.Hinge = laca.rom.Hinge(baff.HingeVector,"K",baff.K,"C",baff.C,"A",baff.A,"Name",baff.Name);
            end

            for j = 1:length(baff.Children)
                    child = laca.rom.Import();
                    [obj_comp,f] = child.baff2rom(baff.Children(j),"parentAnchor",obj.Anchor);
                    
                    if f || ~isempty(obj_comp.Children)
                        obj_comp.EtaVector = obj.Anchor + obj_comp.EtaVector; %TODO - FIX IF EtaVector is empty!
                        obj_comp.Anchor = obj_comp.EtaVector(:,end);
                        obj_comp.Parent = obj;
                        obj.Children{end+1} = obj_comp;
                    end
            end
        end

        function obj = Flatten(obj)

            if isempty(obj.Children)
                return; % Nothing to flatten
            end
            
            tmpChildren = obj.Children;
            obj.Children = {}; % Clear Children
            
            for i = 1:length(tmpChildren)
                flat_child = tmpChildren{i}.Flatten();
                obj = obj + flat_child;
            end
        end

        function model = toModel(obj, opts)
            arguments
                obj
                opts.Name = '';
            end
            % recursively find all children with isROM=true and add them to
            % a list
            function rom_elements = collectisELEMENTs(current_obj, elements)
                if nargin < 2
                    elements = {};
                end
                if current_obj.isELEMENT
                    elements{end+1} = current_obj;
                end
                for i = 1:length(current_obj.Children)
                    elements = collectisELEMENTs(current_obj.Children{i}, elements);
                end
                rom_elements = elements;
            end
            rom_list = collectisELEMENTs(obj);
            model = laca.rom.Model(rom_list, 'Name', opts.Name);
        end

        % Overload the + operator for merging Import objects % TODO - to be completed for all variables
        function obj = plus(obj1, obj2)
            % The result will be stored in obj1
            obj = obj1;
            
            % Aggregate EtaVector
            obj.EtaVector = [obj.EtaVector, obj2.EtaVector];

            % Aggregate Masses (if applicable)
            if isprop(obj, 'Mass') && isprop(obj2, 'Mass')
                obj.BulkMassMass = [obj.BulkMass, obj2.BulkMass];
            end
            
            % Aggregate Children (add obj2 itself and its Children)
            obj.Children = [obj.Children, obj2.Children];
            obj2.Children = {}; % Avoid nesting
            obj.Children{end+1} = obj2;
        end

    end

    methods(Static)
    end
    
end
