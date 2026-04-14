classdef Wing
    %WING Summary of this class goes here
    %   Detailed explanation goes here
    properties
        Children = {};
        Parent;
        BulkMass;
        Inertia;
        BulkStiffness;
        StiffnessMatrix;
        Material; % maybe not needed
        MassMatrix;
        CoM;
        Geometry;
        Hinge;
        isROM = false;
        Name;
    end
    methods
        function obj = Wing(opts)
            %WING Construct an instance of this class
            %   Detailed explanation goes here
            arguments
                opts.Children = {};
                opts.Parent = {};
                opts.BulkMass = [];
                opts.Inertia = [];
                opts.BulkStiffness = [];
                opts.StiffnessMatrix = [];
                opts.MassMatrix = [];
                opts.Geometry = [];
                opts.Hinge = [];
                opts.Name = '';
            end
            obj.Children = opts.Children;
            obj.Parent = opts.Parent;
            obj.BulkMass = opts.BulkMass;
            obj.Inertia = opts.Inertia;
            obj.BulkStiffness = opts.BulkStiffness;
            obj.StiffnessMatrix = opts.StiffnessMatrix;
            obj.MassMatrix = opts.MassMatrix;
            obj.Geometry = opts.Geometry;
            obj.Hinge = opts.Hinge;
            obj.Name = opts.Name;
        end
    
    end

end