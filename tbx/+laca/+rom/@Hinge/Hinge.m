classdef Hinge
    %Hinge Summary of this class goes here
    %   Detailed explanation goes here
    properties
        HingeVector;
        Rotation;
        K
        C
        A
        Name;
    end
    methods
        function obj = Hinge(HingeVector,opts)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            arguments
                HingeVector
                opts.Rotation = 0
                opts.K = 0
                opts.C = 0
                opts.A = [1,0,0;0,1,0;0,0,1]
                opts.Name = ''
            end
            obj.HingeVector = HingeVector;
            obj.Rotation = opts.Rotation;
            obj.K = opts.K;
            obj.C = opts.C;
            obj.A = opts.A;
            obj.Name = opts.Name;
        end
     
    end

end