classdef Mass < laca.model.Point
    %MASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        m; % mass in kg of the object
        I; % 3x3 moment of interia matrix about the point
    end
    
    methods
        function obj = Mass(varargin)
            %MASS Construct an instance of this class
            %   Detailed explanation goes here
            p = inputParser;
            p.addParameter('X',[0;0;0]);
            p.addParameter('m',0)
            p.addParameter('I',zeros(3));
            p.parse(varargin{:});
            
            obj = obj@laca.model.Point(p.Results.X);
            
            for name = string(p.Parameters)
                obj.(name) = p.Results.(name);
            end
            
        end
    end
end

