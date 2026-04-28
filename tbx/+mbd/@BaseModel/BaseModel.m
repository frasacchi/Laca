classdef BaseModel < handle
    %BASEMODEL Summary of this class goes here
    %   Detailed explanation goes here
    properties
        param_names = {};
        output_names = {};
        state_names = {};
        suppressed_DoFs = [];
    end
    properties (Abstract)
        DoFs;
    end
    properties (Dependent,SetAccess = private)
            active_DoFs;
    end

    methods
        function val = get.active_DoFs(obj)
            if isempty(obj.suppressed_DoFs)
                val = 1:obj.DoFs;
                return
            end
            val = setdiff(1:obj.DoFs, obj.suppressed_DoFs, 'stable');
        end
    end


end

