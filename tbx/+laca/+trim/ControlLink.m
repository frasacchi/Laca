classdef ControlLink < matlab.mixin.Heterogeneous
    %CONTROLLINK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Independent
        Dependent
        Factor
    end
    
    methods
        function obj = ControlLink(Dependent,Independent,Factor)
            %CONTROLLINK Construct an instance of this class
            %   Detailed explanation goes here
            p = inputParser;
            p.addRequired('Dependent',@(x)isa(x,'laca.trim.ControlSurface'));
            p.addRequired('Independent',@(x)isa(x,'laca.trim.ControlSurface'));
            p.addRequired('Factor');
            p.parse(Dependent,Independent,Factor);
            
            for name = string(p.Parameters)
                obj.(name) = p.Results.(name);
            end
        end
        
        function writeToFile(obj,fid)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            mni.printing.cards.AELINK(obj.Dependent.Name,...
                {{obj.Independent.Name,obj.Factor}}).writeToFile(fid);
        end
    end
end

