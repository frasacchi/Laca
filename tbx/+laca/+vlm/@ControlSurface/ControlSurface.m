classdef ControlSurface < laca.vlm.Base
    %CONTROLSURFACE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name = '';
        Type = '';
        Side = laca.vlm.Side.Starboard;
        HingeNodes = [];
        Nodes = [];
        Panels = [];
        NControl;
        Idx = 0;
        Deflection = 0;
    end
    
    methods
        function obj = ControlSurface(Name,NControl)
            obj.Name = Name;
            obj.NControl = NControl;
        end
    end
    methods(Static)
        function obj = None()
            obj = laca.vlm.ControlSurface('None',0);
        end
    end
end

