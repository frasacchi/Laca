function [out] = stitch_sections(Sections)
%STICTH_SECTIONS Summary of this function goes here
%   Detailed explanation goes here

% get panels
res = cellfun(@(x)x.Panels,Sections,'UniformOutput',false);
panels = cat(2,res{:});
np = cellfun(@(x)x.NPanels,Sections);
node_idx = cumsum([0,cellfun(@(x)x.NNodes,Sections)]);
idx = cumsum([0,np]);
for i = 1:length(np)
    panels(:,idx(i)+1:idx(i+1)) = panels(:,idx(i)+1:idx(i+1)) + ...
        repmat(node_idx(i),4,np(i));
end

%get nodes
res = cellfun(@(x)x.base_nodes,Sections,'UniformOutput',false);
nodes = cat(2,res{:});
% % get RingNodes
% ringNodes = cat(2,Sections.RingNodes);

% get isLE
res = cellfun(@(x)x.isLE,Sections,'UniformOutput',false);
isLE = cat(1,res{:});
% get isLE
res = cellfun(@(x)x.Normalwash,Sections,'UniformOutput',false);
Normalwash = cat(1,res{:});

% get isTE
res = cellfun(@(x)x.isTE,Sections,'UniformOutput',false);
isTE = cat(1,res{:});

% stitch together connectivity
for i = 1:length(Sections)-1
    % get rhs panels
    sec_lhs = Sections{i};
    con_lhs = sec_lhs.Connectivity;
    lhs_idx = find(isnan(con_lhs(2,:)));
    N_lhs = size(con_lhs,2);

    % get lhs panels
    sec_rhs = Sections{i+1};
    con_rhs = sec_rhs.Connectivity;
    rhs_idx = find(isnan(con_rhs(4,:)));

    %stitch together lhs and rhs
    for j = 1:length(lhs_idx)
        con_lhs(2,lhs_idx(j)) = N_lhs + rhs_idx(j);
        con_rhs(4,rhs_idx(j)) = lhs_idx(j) - N_lhs - 1;
    end

    Sections{i+1}.Connectivity = con_rhs;
    Sections{i}.Connectivity = con_lhs;
end
res = cellfun(@(x)x.Connectivity,Sections,'UniformOutput',false);
connectivity = cat(2,res{:});
idx = cumsum([0,np]);
for i = 1:length(np)
    connectivity(:,idx(i)+1:idx(i+1)) = connectivity(:,idx(i)+1:idx(i+1)) + ...
        repmat(idx(i),4,np(i));
end
Section = laca.vlm.Section(panels,nodes,isLE,isTE,connectivity);
Section.Normalwash = Normalwash;
Section.Rot = Sections{1}.Rot;
Section.R = Sections{1}.R;
out = {Section};
% Section.RingNodes = ringNodes;
end

