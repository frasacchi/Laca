classdef Point
    %POINT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
         X; % 3x1 location of the point
    end
    
    methods
%         function cp = copy(obj)
%             cp = laca.model.Point(obj.X);
%         end
        function obj = Point(X)
            %POINT Construct an instance of this class
            %   Detailed explanation goes here
            obj.X = X;
        end
        
        function obj = rotateAbout(obj,p,v,theta)
            %ROTATEABOUT rotate the point about a vector
            %   rotates the point about a line defined by the point 'p' and
            %   the vector 'v' by an angle of 'theta' degrees
            [par,perp] = xProjectV(obj.X-p, v);
            w = cross(v, perp);
            w = w/norm(w);
            rot_b = (par + perp * cosd(theta) + norm(perp) * w * sind(theta)); 
            obj.X = rot_b + p;
        end
    end
end

function [par,perp] =  xProjectV(x, v)
    % Project x onto v, returning parallel and perpendicular components
    par = dot(x, v) / dot(v, v) * v;
    perp = x - par;
end

