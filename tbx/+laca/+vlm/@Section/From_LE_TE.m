function obj = From_LE_TE(LE,TE,chord_eta_LHS,chord_eta_RHS,NormalWash,controlSurface)
%FROM_LE_TE generates Section from a definition of the LE and TE of a wing
%
% LE - 3xN matrix of N positions making up the leading edge
% TE - 3xN matrix of N positions making up the Trailing edge
% NChord - number of panels to place along the chord
%

% check inputs
NSpan = size(LE,2)-1;
if NSpan ~= size(TE,2)-1
    error('LE and TE must have the same number of panels')
end
if NSpan < 1
    error ('NSpan must be at least 2')
end
NChord = length(chord_eta_LHS)-1;
if length(chord_eta_LHS) ~= length(chord_eta_RHS)
    error ('length of chord_eta_LHS and chord_eta_RHS must be the same')
end

nodes = zeros(3,(NSpan+1)*(NChord+1));
dir = TE - LE;

chord_step = (chord_eta_RHS-chord_eta_LHS)./(NChord);
chord_eta = repmat(chord_eta_LHS',1,NSpan + 1) + repmat(0:NSpan,NChord+1,1).*repmat(chord_step',1,NSpan+1);


if exist('controlSurface','var') && controlSurface.NControl > 0
    start_hinge_idx = (NSpan+1)*(NChord-controlSurface.NControl)+1;
    end_hinge_idx = (NSpan+1)*(NChord-controlSurface.NControl+1);
    controlSurface.HingeNodes = [start_hinge_idx,end_hinge_idx];
end
for j = 1:NChord+1
    start_idx = (NSpan+1)*(j-1) + 1;
    end_idx = (NSpan+1)*j;
    nodes(:,start_idx:end_idx) = LE + dir.*repmat(chord_eta(j,:),3,1);
    if j>NChord-controlSurface.NControl+1
        controlSurface.Nodes = [controlSurface.Nodes,start_idx:end_idx];
    end
end

N = NSpan*NChord;
panels = zeros(4,N);
normalwash = zeros(N,1);
connectivity = ones(4,N)*nan;
isTE = false(N,1);
isLE = false(N,1);
for j = 1:NChord
    isTE_idx = j == NChord;
    for i = 1:NSpan
        idx = (j-1)*NSpan + i;
        normalwash(idx) = mean(NormalWash(i:i+1));
        panels(1,idx) = (j-1)*(NSpan+1)+i;
        panels(2,idx) = (j-1)*(NSpan+1)+i+1;
        panels(3,idx) = (j)*(NSpan+1)+i+1;
        panels(4,idx) = (j)*(NSpan+1)+i;
        if j > 1
            connectivity(1,idx) = idx - NSpan;
        else
            isLE(idx) = true;
        end
        if ~isTE_idx
            connectivity(3,idx) = idx + NSpan;
        else
            isTE(idx,1) = true;
        end
        if i > 1
            connectivity(4,idx) = idx - 1;
        end
        if i<NSpan
            connectivity(2,idx) = idx + 1;
        end
    end
end
obj = laca.vlm.Section(panels,nodes,isLE,isTE,connectivity);
obj.ControlSurfaces = controlSurface;
obj.Normalwash = normalwash;
end

