function out = createNastranExample(obj,varargin)
    % CREATESTREAMWISEVARIANT - converts panels to ensure all sides
    % are parrallel with the x axis (as is required for MSC
    % Nastran). 
    % Parameters:
    %   RefChord -  defines at which chordwise position the new 
    %               panels will cut the existing panels
    %   SweepTol -  defines tolerence for changes in sweep between
    %               panels before new streamwise panels are created
    %   YTol -      defines minimum y seperation between 2 panels
    %

    p = inputParser();
    p.addParameter('Dir',[1;0;0]);
    p.parse(varargin{:})

    LE = obj.LE;
    old_TE = obj.TE;
    old_c = vecnorm(old_TE-LE);
    TE = LE + p.Results.Dir * old_c;
    
    %% generate Wing Sections
    new_WingSections = {};
    for i = 1:size(LE,2)-1
        new_WingSections{i} = laca.model.WingSection(LE(:,i:i+1),TE(:,i:i+1));
        % new_WingSections{i}.Normalwash = Normalwash(i:i+1);
    end

    %% figure out where each control surface now lives
    centroids = cell2mat(cellfun(@(x)x.Centroid,new_WingSections,'UniformOutput',false));
    for i = 1:length(obj.WingSections)
        if obj.WingSections{i}.hasControlSurf
            tmp_centroid = obj.WingSections{i}.Centroid;
            dist = arrayfun(@(j)norm(centroids(:,j)-tmp_centroid),1:length(new_WingSections));
            [~,idx] = min(dist);
            new_WingSections{idx}.ControlRefChord = obj.WingSections{i}.ControlRefChord;
            new_WingSections{idx}.ControlName = obj.WingSections{i}.ControlName;
        end
    end
    out = obj.copy();
    out.WingSections = new_WingSections;
end