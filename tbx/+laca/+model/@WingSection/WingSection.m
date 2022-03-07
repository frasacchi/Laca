classdef WingSection < matlab.mixin.Heterogeneous & matlab.mixin.Copyable
    %WINGSECTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties        
        LE;  % 3x2 points along Leading Edge
        TE;  % 3x2 points along Trailing Edge
        Normalwash = [0,0]; % Normalwash at each station
        ClCorrection = [1,1]; % Cl correction factor at each station
        CmCorrection = [1,1]; % Cm correction factor at each station
        Name = '';
        SplineSet = [];
    end
    
    properties
       ControlRefChord = [0 0];
       ControlName = '';
       ControlDeflection = 10;
    end
    
    properties(Dependent = true)
        hasControlSurf;
        NSurfaces;
        Centroid;
        Normal;
        RefDir;
        Midpoint;   % Midpoints between LE and TE
        TotalArea;
        MainChord;
        ControlChord;
        TotalChord;
        ControlLE;
        MainArea;
        ControlArea;
        MAC;
    end
    
    methods
        function val = get.Midpoint(obj)
            val = obj.RefNodes(0.5);
        end
        function val = get.Normal(obj)
            val = cross(obj.TE(:,1)-obj.LE(:,1),obj.LE(:,2)-obj.LE(:,1));
            val = val/norm(val);
        end
        function val = get.RefDir(obj)
%             val = mean([obj.LE,obj.TE],2);
             val = obj.Midpoint(:,2)-obj.Midpoint(:,1);
             val = val/norm(val);              
        end
        function val = get.Centroid(obj)
           val = mean([obj.LE,obj.TE],2); 
        end
        function val = get.MAC(obj)
            lam = obj.TotalChord(2)/obj.TotalChord(1);
            val = 2/3 * obj.TotalChord(1) * (1+lam+lam^2)/(1+lam);
        end
        function val = get.MainChord(obj)
            val = vecnorm(obj.ControlLE-obj.LE);
        end
        function val = get.ControlChord(obj)
            val = vecnorm(obj.TE-obj.ControlLE);
        end
        function val = get.TotalChord(obj)
            val = vecnorm(obj.TE-obj.LE);
        end
        function val = get.ControlLE(obj)
            val = obj.RefNodes(1 - obj.ControlRefChord);
        end
        function val = get.hasControlSurf(obj)
           val = nnz(obj.ControlRefChord)>0; 
        end
        function val = get.NSurfaces(obj)
           if obj.hasControlSurf
               val = 2;
           else
               val = 1;
           end
        end
        function val = get.MainArea(obj)
            % split panel into two triangles, the are of each triangle is
            % the cross product of the two sides
            val =  obj.get_area(obj.LE(:,1),obj.LE(:,2),...
                obj.ControlLE(:,2),obj.ControlLE(:,1));               
        end
        function val = get.ControlArea(obj)
            % split panel into two triangles, the are of each triangle is
            % the cross product of the two sides
            val =  obj.get_area(obj.ControlLE(:,1),obj.ControlLE(:,2),...
                obj.TE(:,2),obj.TE(:,1));              
        end
        function val = get.TotalArea(obj)
            % split panel into two triangles, the are of each triangle is
            % the cross product of the two sides
            val =  obj.get_area(obj.LE(:,1),obj.LE(:,2),...
                obj.TE(:,2),obj.TE(:,1));              
        end
    end    
    
    methods(Access = private)
        function val = get_area(~,c1,c2,c3,c4)
           %GET_AREA gets the are of a square with the 4 corners c1->c4 
           %(in clockwise or anticlockwise order) 
           % splits square into two triangles and calculates the are using
           % the cross product
           area1 = 0.5*norm(cross(c4-c1,c2-c1)); 
           area3 = 0.5*norm(cross(c2-c3,c4-c3)); 
           val = area1 + area3;  
        end
    end
    
    methods    
        function val = RefNodes(obj,percentage)
            % REFNODE return the point along the two sides of the panel
            % that are 'percentage' percent along the chord, from the LE
            switch length(percentage)  
                case 1
                    val = obj.LE + (obj.TE-obj.LE)*percentage;   
                case 2
                    val = zeros(3,2);
                    for i = 1:2
                        val(:,i) = obj.LE(:,i) + (obj.TE(:,i)-obj.LE(:,i))*percentage(i);
                    end
                otherwise
                    error('Length of percentage must be either 1 or 2, however it is %.0f',length(percentage))
            end
        end
        
        function obj = WingSection(LE,TE)
            %WINGSECTION Construct an instance of this class
            %   Detailed explanation goes here
            obj.LE = LE;
            obj.TE = TE;            
        end 
        
        function obj = Rx(obj,deg)
            if deg ~= 0
                obj.LE = fh.rotx(deg)*obj.LE;
                obj.TE = fh.rotx(deg)*obj.TE;
            end
        end
        
        function obj = Ry(obj,deg)
            if deg ~= 0
                obj.LE = fh.roty(deg)*obj.LE;
                obj.TE = fh.roty(deg)*obj.TE;
            end
        end
        
        function obj = Rz(obj,deg)
            if deg ~= 0
                obj.LE = fh.rotz(deg)*obj.LE;
                obj.TE = fh.rotz(deg)*obj.TE;
            end
        end
    end
end

