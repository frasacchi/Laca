classdef Wing < matlab.mixin.Copyable
    %WING Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Mass = laca.model.Mass.empty;
    end
    
    properties
        WingSections;
        Name = [];
        GridIDs = [];        
    end
    
    properties(Dependent = true)
       NSections; 
       NControlSurfs;
       NPanels;
       LE;
       TE;
       Midpoint;
       Area;
       MAC;
       Span;
    end
    
    methods
        function val = get.NSections(obj)
           val = length(obj.WingSections);
        end
        function val = get.NControlSurfs(obj)
            val = nnz(arrayfun(@(x)x.hasControlSurf,obj.WingSections));
        end
        function val = get.NPanels(obj)
           val = obj.NControlSurfs + obj.NSections;
        end
        function LE = get.LE(obj)
           LE = zeros(3,obj.NSections+1);
           LE(:,1) = obj.WingSections(1).LE(:,1);
           for i = 1:obj.NSections
              LE(:,i+1) = obj.WingSections(i).LE(:,2); 
           end
        end
        function TE = get.TE(obj)
           TE = zeros(3,obj.NSections+1);
           TE(:,1) = obj.WingSections(1).TE(:,1);
           for i = 1:obj.NSections
              TE(:,i+1) = obj.WingSections(i).TE(:,2); 
           end
        end
        function Midpoint = get.Midpoint(obj)
            Midpoint = obj.RefNodes(0.5);
        end
        function val = get.Area(obj)
           val = sum(arrayfun(@(x)x.TotalArea,obj.WingSections)); 
        end
        function val = get.MAC(obj)
           val =  sum(arrayfun(@(x)x.TotalArea*x.MAC,obj.WingSections)); 
           val = val / obj.Area;
        end
        function val = get.Span(obj)
           max_y =  max(arrayfun(@(x)max(x.LE(2,:)),obj.WingSections)); 
           min_y =  min(arrayfun(@(x)min(x.LE(2,:)),obj.WingSections));
           val = max_y - min_y;
        end
    end
    
    methods
        function obj = Wing(WingSections,varargin)
            %WING Construct an instance of this class
            %   Detailed explanation goes here
            obj.WingSections = WingSections;
        end
        
        function obj = Rz(obj,deg)
            obj.WingSections = arrayfun(@(x)x.Rz(deg),obj.WingSections);
        end
        function obj = Ry(obj,deg)
            obj.WingSections = arrayfun(@(x)x.Ry(deg),obj.WingSections);
        end
        function obj = Rx(obj,deg)
            obj.WingSections = arrayfun(@(x)x.Rx(deg),obj.WingSections);
        end
        
        function plt_obj = draw(obj,varargin)
            p = inputParser;
            p.addParameter('PatchArgs',{})
            p.addParameter('Rotate',eye(3))
            p.parse(varargin{:})
            panels = obj.get_panel_coords;
            for i = 1:size(panels,3)
                for j = 1:4
                    panels(j,:,i) = panels(j,:,i)*p.Results.Rotate;
                end
            end
            func = @(n)reshape(panels(:,n,:),4,[]);
            plt_obj = patch(func(1),func(2),func(3),'r',p.Results.PatchArgs{:});
        end
        
        function obj = split_sections(obj,varargin)
            p = inputParser;
            p.addParameter('MaxWidth',0.2);
            p.addParameter('pos',[]);
            p.parse(varargin{:});
            wingSections = laca.model.WingSection.empty;
            for i = 1:length(obj.WingSections)
                wingSections = [wingSections,obj.WingSections(i).split_section(varargin{:})];
            end
            out = laca.model.Wing(wingSections);
            out.Name = obj.Name;
            out.GridIDs = obj.GridIDs;            
        end
        
        function out = split_chordwise(obj,varargin)
            p = inputParser;
            p.addParameter('NChord',5);
            p.parse(varargin{:});
            wingSections = laca.model.WingSection.empty;
            for i = 1:length(obj.WingSections)
                wingSections = [wingSections,obj.WingSections(i).split_chordwise(varargin{:})];
            end
            out = laca.model.Wing(wingSections);
            out.Name = obj.Name;
            out.GridIDs = obj.GridIDs;            
        end
        
        function val = RefNodes(obj,percentage)
            % REFNODE return the point along the two sides of the panel
            % that are 'percentage' percent along the chord, from the LE
            val = obj.LE + (obj.TE-obj.LE)*percentage;
        end
                
        function res = get_panel_coords(obj)
            % GET_PANEL_COORDS returns an array of coordinate to fraw the
            % wing as a set of panels
            % the output 'res' has the shape 4,3,N, where the 1st dimension
            % is the 4 corners of each panel, the 2nd is the X Y Z pos of 
            % each corner, and the third is the number of panels.
            % the corner order goes TE->LE->LE->TE
            res = zeros(4,3,obj.NPanels);
            idx = 1;
            for i = 1:length(obj.WingSections)
               nPanels_i = obj.WingSections(i).NSurfaces;
               res(:,:,idx:idx+nPanels_i-1) = obj.WingSections(i).get_panel_coords;
               idx = idx + nPanels_i;
            end
        end
    end
    methods(Static)
        function obj = From_LE_TE(LE,TE,RefControlSurfs)
            %create TE points            
            %create object
            wingSections = laca.model.WingSection.empty;
            for i = 1:size(LE,2)-1
                wingSections(i) = laca.model.WingSection(LE(:,i:i+1),...
                    TE(:,i:i+1));
            end
            % apply control surfs
            for i = 1:length(RefControlSurfs)
                idx = RefControlSurfs(i).RefIdx;
                wingSections(idx).ControlRefChord = RefControlSurfs(i).RefChord;
                wingSections(idx).ControlName = RefControlSurfs(i).Name;
            end
            obj = laca.model.Wing(wingSections);
        end
        
        function obj = From_RHS_LE_TE(LE,TE,ControlSurfs)
            %ensure first point is on the centreline
            if LE(2,1)~=0
               % continue LE and TE sweep / dihedral to the XZ plane
               LE_zero = get_intersection(LE(:,1:2),[0,0,0]',[0,1,0]);
               TE_zero = get_intersection(TE(:,1:2),[0,0,0]',[0,1,0]);
               LE = [LE_zero,LE];
               TE = [TE_zero,TE];
               % update aileron idx to account for extra panel
               for i = 1:length(ControlSurfs)
                   ControlSurfs(i).RefIdx = ControlSurfs(i).RefIdx+1;
               end
            end
            num_semi_panels = size(LE,2)-1;
            
            %reflect the coordinates
            LE = [fliplr(LE),LE(:,2:end)];
            LE(2,1:num_semi_panels) = -1 * LE(2,1:num_semi_panels);
            TE = [fliplr(TE),TE(:,2:end)];
            TE(2,1:num_semi_panels) = -1 * TE(2,1:num_semi_panels);
            
            % Define ControlSurfs            
            Left_ControlSurfs = ControlSurfs;
            for i = 1:length(Left_ControlSurfs)
               Left_ControlSurfs(i).RefIdx = num_semi_panels - Left_ControlSurfs(i).RefIdx + 1;
               Left_ControlSurfs(i).Name = [Left_ControlSurfs(i).Name,'_l'];
            end
            
            Right_ControlSurfs = ControlSurfs;
            for i = 1:length(ControlSurfs)
               Right_ControlSurfs(i).RefIdx = Right_ControlSurfs(i).RefIdx+num_semi_panels;
               Right_ControlSurfs(i).Name = [Right_ControlSurfs(i).Name,'_r'];
            end
            
            %create object
            obj = laca.model.Wing.From_LE_TE(LE,TE,[Left_ControlSurfs,Right_ControlSurfs]);
        end       
    end
end

