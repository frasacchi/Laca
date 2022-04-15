function obj = From_LE_TE(LE,TE,NChord)
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

% create some params
N = NSpan*NChord;
panels = zeros(4,3,N);
connectivity = ones(4,N)*nan;
isTE = false(N,1);
isLE = false(N,1);
LT = TE-LE;

chord_eta = linspace(0,1,NChord+1);

for j = 1:NChord
    AB = LE+LT.*chord_eta(j);
    DC = LE+LT.*chord_eta(j+1);
    isTE_idx = j == NChord;
    for i = 1:NSpan
        idx = (j-1)*NSpan + i;
        panels(1,:,idx) = AB(:,i);
        panels(2,:,idx) = AB(:,i+1);
        panels(3,:,idx) = DC(:,i+1);
        panels(4,:,idx) = DC(:,i);
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
obj = laca.panel.Section(panels,isLE,isTE,connectivity);
end

