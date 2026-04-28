classdef BaseRC < mbd.BaseModel
    % properties (Abstract)
    %     DoFs;
    % end
    % properties
    %     suppressed_DoFs = [];
    % end
    % properties (Dependent,SetAccess = private)
    %         active_DoFs;
    % end

    % methods
    %     function val = get.active_DoFs(obj)
    %         if isempty(obj.suppressed_DoFs)
    %             val = 1:obj.DoFs;
    %             return
    %         end
    %         val = setdiff(1:obj.DoFs, obj.suppressed_DoFs, 'stable');
    %     end
    % end

end