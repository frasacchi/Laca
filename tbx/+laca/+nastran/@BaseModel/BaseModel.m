classdef BaseModel < laca.nastran.BaseTrimParameters
    %BASEMODEL Summary of this class goes here
    %   Detailed explanation goes here 
    properties
        Name = 'Default Name'
    end
    methods
        function str = config_string(obj)
            str = '';
        end
    end
    methods (Abstract)
        writeToFile(folder)       
    end
end

