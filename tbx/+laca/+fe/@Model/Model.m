classdef Model
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here 
    properties
        Sections;
        Name;
    end
    
    properties(Dependent = true)
       Normalwash;
       IDs;
       Wkk;
    end
    
    methods
        function obj = Model(Sections,varargin)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            p = inputParser;
            p.addRequired('Sections');
            p.addParameter('Name','');
            p.parse(Sections,varargin{:})

            for name = string(p.Parameters)
                obj.(name) = p.Results.(name);
            end
        end
        function writeToFolder(obj,folder)
            error('Not Implemented')
        end
        function writeAeroToFile(obj,fid)
            mni.printing.bdf.writeHeading(fid,sprintf('%s Aerodynamic Panels',obj.Name));
            for i = obj.Sections
                i.writeAeroToFile(fid);
            end
            
            % generate normalwash
            [~,idx] = sort(obj.IDs);
            mni.printing.bdf.writeSubHeading(fid,'Panel Normalwash')
            mni.printing.bdf.writeColumnDelimiter(fid,'8');
            mni.printing.cards.DMI('W2GJ',...
                deg2rad(obj.Normalwash(idx)),2,1,0).writeToFile(fid);
            
            % generate wingtip C_l correction factor
            mni.printing.bdf.writeSubHeading(fid,'Cl Correction Factor')
            mni.printing.bdf.writeColumnDelimiter(fid,'8');
            mni.printing.cards.DMI('WKK',...
                reshape(cell2mat(obj.Wkk(idx))',[],1),3,1,0).writeToFile(fid);
        end
        function writeSplinesToFile(obj,fid)
            for i = obj.Sections
                i.writeSplinesToFile(fid);
            end
        end
        function normalwash = get.Normalwash(obj)
            normalwash = arrayfun(@(x)x.Normalwash,obj.Sections,'UniformOutput',false);
            normalwash = cat(1,normalwash{:});  
        end
        function ids = get.IDs(obj)
            ids = arrayfun(@(x)x.IDs,obj.Sections,'UniformOutput',false);
            ids = cat(1,ids{:});  
        end
        function wkk = get.Wkk(obj)
            wkk = arrayfun(@(x)x.Wkk,obj.Sections,'UniformOutput',false);
            wkk = cat(1,wkk{:});            
        end
    end
    
    methods(Static)
        function obj = FromLACA(lacaModel)
            Sections = laca.fe.Section.empty;
            ID = 1e5+1;
            for wing = lacaModel.Wings
                Sections(end+1) = laca.fe.Section.FromWing(wing,'ID',ID);
                ID = max(Sections(end).IDs)+1;                
            end
            obj = laca.fe.Model(Sections,'Name',lacaModel.Name);
        end
    end
end

