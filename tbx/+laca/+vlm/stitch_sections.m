function [Section] = stitch_sections(Sections)
%STICTH_SECTIONS Summary of this function goes here
%   Detailed explanation goes here

% get panels
panels = cat(2,Sections.Panels);
np = [Sections.NPanels];
node_idx = cumsum([0,[Sections.NNodes]]);
idx = cumsum([0,[Sections.NPanels]]);
for i = 1:length(np)
    panels(:,idx(i)+1:idx(i+1)) = panels(:,idx(i)+1:idx(i+1)) + ...
        repmat(node_idx(i),4,np(i));
end

%get nodes
nodes = cat(2,Sections.base_nodes);

% % get RingNodes
% ringNodes = cat(2,Sections.RingNodes);

% get isLE
isLE = cat(1,Sections.isLE);
% get isLE
Normalwash = cat(1,Sections.Normalwash);

% get isTE
isTE = cat(1,Sections.isTE);

% stitch together connectivity
for i = 1:length(Sections)-1
    % get rhs panels
    sec_lhs = Sections(i);
    con_lhs = sec_lhs.Connectivity;
    lhs_idx = find(isnan(con_lhs(2,:)));
    N_lhs = size(con_lhs,2);

    % get lhs panels
    sec_rhs = Sections(i+1);
    con_rhs = sec_rhs.Connectivity;
    rhs_idx = find(isnan(con_rhs(4,:)));

    %stitch together lhs and rhs
    for j = 1:length(lhs_idx)
        con_lhs(2,lhs_idx(j)) = N_lhs + rhs_idx(j);
        con_rhs(4,rhs_idx(j)) = lhs_idx(j) - N_lhs - 1;
    end

    Sections(i+1).Connectivity = con_rhs;
    Sections(i).Connectivity = con_lhs;
end
connectivity = cat(2,Sections.Connectivity);
np = [Sections.NPanels];
idx = cumsum([0,np]);
for i = 1:length(np)
    connectivity(:,idx(i)+1:idx(i+1)) = connectivity(:,idx(i)+1:idx(i+1)) + ...
        repmat(idx(i),4,np(i));
end
Section = laca.vlm.Section(panels,nodes,isLE,isTE,connectivity);
Section.Normalwash = Normalwash;
Section.Rot = Sections(1).Rot;
Section.R = Sections(1).R;
% Section.RingNodes = ringNodes;
end

