classdef BaseDoF < matlab.mixin.Heterogeneous
    %NASTRANDOF Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name;
        Value;
    end
    
    methods
        function obj = BaseDoF(Name,Value)
            obj.Name = Name;
            obj.Value = Value;
        end
    end
end

