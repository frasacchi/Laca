classdef RefControlSurf
    %AILERON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        RefIdx;
        RefChord;
        Name;
        isControlSurface = true;
    end
    
    methods
        function obj = RefControlSurf(RefIdx,RefChord,Name)
            %AILERON Construct an instance of this class
            %   Detailed explanation goes here
            obj.RefIdx = RefIdx;
            obj.RefChord = RefChord;
            obj.Name = Name;
        end
    end
    methods(Static)
        function obj = Empty()
            obj = laca.model.RefControlSurf([0,0],[0,0],'');
            obj.isControlSurface = false;
        end
    end
end

