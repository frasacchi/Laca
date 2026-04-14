classdef Model
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    properties
        Elements; %Import elements TODO - define type
        Name;
    end
    methods
        function obj = Model(Elements,opts)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            arguments
                Elements
                opts.Name = ''
            end
            obj.Elements = Elements;
            obj.Name = opts.Name;
        end
     
    end

end