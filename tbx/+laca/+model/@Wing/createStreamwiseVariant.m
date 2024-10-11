function out = createStreamwiseVariant(obj,varargin)
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
    p.addParameter('RefChord',0.5,@(x)x>=0 & x<=1);
    p.addParameter('SweepTol',1,@(x)x>=0 & x<=1);
    p.addParameter('RefTol',0.1,@(x)x>=0 & x<=1);
    p.parse(varargin{:})

    old_LE = obj.LE;
    old_TE = obj.TE;

    %% get Ref Nodes
    Nodes = (old_TE - old_LE) * p.Results.RefChord + old_LE;
    RefDirsLE = zeros(3,size(old_LE,2)-1);
    RefDirsTE = zeros(3,size(old_LE,2)-1);
    % get ref directions
    for i = 1:size(old_LE,2)-1
       RefDirsLE(:,i) =  old_LE(:,i+1)-old_LE(:,i);
       RefDirsTE(:,i) =  old_TE(:,i+1)-old_TE(:,i);
    end
    
    % for each substantial change in LE and TE direction add a ref line
    for i = 1:size(RefDirsLE,2)-1
        %check LE
       angle = acosd(dot(RefDirsLE(:,i),RefDirsLE(:,i+1))/...
           (norm(RefDirsLE(:,i))*norm(RefDirsLE(:,i+1))));
       if abs(angle)>p.Results.SweepTol
           normal = [0 ; RefDirsLE(2:3,i+1)];
           [new_node,idx] = get_intersection(Nodes,old_LE(:,i+1),normal);
           if abs(norm(new_node-Nodes(:,idx))) > p.Results.RefTol &&...
                    abs(norm(new_node-Nodes(:,idx+1))) > p.Results.RefTol
                Nodes = [Nodes(:,1:idx),new_node,Nodes(:,idx+1:end)];
           end
       end
       % Check TE
       angle = acosd(dot(RefDirsTE(:,i),RefDirsTE(:,i+1))/...
           (norm(RefDirsTE(:,i))*norm(RefDirsTE(:,i+1))));
       if abs(angle)>p.Results.SweepTol
           normal = [0 ; RefDirsTE(2:3,i+1)];
           [new_node,idx] = get_intersection(Nodes,old_TE(:,i+1),normal);
           if abs(norm(new_node-Nodes(:,idx))) > p.Results.RefTol &&...
                    abs(norm(new_node-Nodes(:,idx+1))) > p.Results.RefTol
                Nodes = [Nodes(:,1:idx),new_node,Nodes(:,idx+1:end)];
           end
       end
    end
    
    %% find where the plane defined by the ref nodes and the vector
    % [0 1 0]' intersects the TE and LE
    [new_LE,new_TE,tmp_LE,tmp_TE] = deal(zeros(size(Nodes)));
    Normalwash = zeros(1,size(Nodes,2));
    for i = 1:size(Nodes,2)
        %get intersections
        if i < size(Nodes,2)
            NodeDir = Nodes(:,i+1)-Nodes(:,i);
        else
            NodeDir = Nodes(:,i)-Nodes(:,i-1);
        end
        NodeDir = NodeDir/norm(NodeDir);
        Panel_normal = cross([1 0 0]',NodeDir);        
        plane_normal = cross(Panel_normal,[1 0 0]');
        
        tmp_LE(:,i) = get_intersection(old_LE,Nodes(:,i),plane_normal);
        tmp_TE(:,i) = get_intersection(old_TE,Nodes(:,i),plane_normal);
        
        %create rotation matrix and find AoA
        vec = tmp_TE(:,i) - tmp_LE(:,i);
        Normalwash(i) = atand(dot(vec,Panel_normal)/vec(1));
        
        % project LE and TE onto the panel
        new_LE(:,i) = dot(tmp_LE(:,i)-Nodes(:,i),[1 0 0]')*[1 0 0]' + Nodes(:,i);
        new_TE(:,i) = dot(tmp_TE(:,i)-Nodes(:,i),[1 0 0]')*[1 0 0]' + Nodes(:,i);
        
        % correct chordlength (large AoAs shorthen the effective chord length)
        new_LE(:,i) = new_LE(:,i) + tand(abs(Normalwash(i))/2)*sind(Normalwash(i))*norm(vec)*[-1 0 0]';
        new_TE(:,i) = new_TE(:,i) + tand(abs(Normalwash(i))/2)*sind(Normalwash(i))*norm(vec)*[1 0 0]';
    end
    
    %% generate Wing Sections
    new_WingSections = {};
    for i = 1:size(new_LE,2)-1
        new_WingSections{i} = laca.model.WingSection(new_LE(:,i:i+1),new_TE(:,i:i+1));
        new_WingSections{i}.Normalwash = Normalwash(i:i+1);
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