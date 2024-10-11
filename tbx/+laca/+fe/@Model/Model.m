classdef Model
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here 
    properties
        Wings;
        Name;
    end
    
    properties(Dependent = true)
       Normalwash;
       IDs;
       Wkk;
    end
    
    methods
        function obj = Model(Wings,opts)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            arguments
                Wings
                opts.Name = ''
            end
            obj.Wings = Wings;
            obj.Name = opts.Name;
        end
        function writeToFolder(obj,folder)
            error('Not Implemented')
        end
        function writeAeroToFile(obj,fid)
            mni.printing.bdf.writeHeading(fid,sprintf('%s Aerodynamic Panels',obj.Name));
            for i = obj.Wings
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
        function writeSpline6ToFile(obj,fid,varargin)
            for i = obj.Wings
                i.writeSpline6ToFile(fid,varargin{:});
            end
        end
        function writeSpline4ToFile(obj,fid,varargin)
            for i = obj.Wings
                i.writeSpline4ToFile(fid,varargin{:});
            end
        end
        function writeSpline1ToFile(obj,fid,varargin)
            for i = obj.Wings
                i.writeSpline1ToFile(fid,varargin{:});
            end
        end
        function normalwash = get.Normalwash(obj)
            normalwash = arrayfun(@(x)x.Normalwash,obj.Wings,'UniformOutput',false);
            normalwash = cat(1,normalwash{:});  
        end
        function ids = get.IDs(obj)
            ids = arrayfun(@(x)x.IDs,obj.Wings,'UniformOutput',false);
            ids = cat(1,ids{:});  
        end
        function wkk = get.Wkk(obj)
            wkk = arrayfun(@(x)x.Wkk,obj.Wings,'UniformOutput',false);
            wkk = cat(1,wkk{:});            
        end
    end
    
    methods(Static)
        function obj = FromLACA(model,opts)
            arguments
                model
                opts.ID = 100001;
                opts.IGID = 999;
            end
            Wings = laca.fe.Wing.empty;
            ID = opts.ID;
            for wing = model.Wings
                Wings(end+1) = laca.fe.Wing.FromWing(wing{1},ID=ID,IGID=opts.IGID);
                ID = max(Wings(end).IDs)+1;                
            end
            obj = laca.fe.Model(wings,'Name',model.Name);
        end
    end
end

