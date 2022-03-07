classdef RefControlSurf
    %AILERON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        RefIdx;
        RefChord;
        Name;
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
end

