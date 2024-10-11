% this test generates a rectagular wing which is used to check:
% - vlm panels are generated in correct place
% - panel normals are correct
% - Panel Area is correct
% - Connectivity matrices are correct
%
% the wing is identical to that in 'StraightSectionTests' but is built just
% from RHS data. Wing properties are:
% - Span = 1m
% - Chord = 0.1m
% - Spanwise Panels = 20
% - Chordwise Panels = 5
%
% author: Fintan healy      Date: 19/04/2022
% email: fintan.healy@bristol.ac.uk

Span = 1;
NSpan = 20;
NChord = 5;
Chord = 0.1;

LE = [0 0;0 Span/2;0 0];
TE = LE;
TE(1,:) = -Chord;
wing = laca.model.Wing.From_RHS_LE_TE(LE,TE,{});
vlm_wing = laca.vlm.Wing.From_laca_wing(wing,Span/NSpan,NChord,true);

N = NChord*NSpan;

% check the generated panels
%% check number of panels
assert(vlm_wing.NPanels == N,'Panel Number not NChord x NSpan')

%% check the location of Nodes ABCD for the first panel
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(1,1)),[0;-Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(2,1)),[0;-Span/2+Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(3,1)),[-Chord/NChord;-Span/2+Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,1)),[-Chord/NChord;-Span/2;0])

%% check the location of Nodes ABCD for the last panel
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(1,end)),[-Chord+Chord/NChord;Span/2-Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(2,end)),[-Chord+Chord/NChord;Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(3,end)),[-Chord;Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,end)),[-Chord;Span/2-Span/NSpan;0])

%% check the location of the centroid for the first and last panel
assert_tol(vlm_wing.Centroid(:,1),[-Chord/(NChord*2);-Span/2+Span/(NSpan*2);0])
assert_tol(vlm_wing.Centroid(:,end),[-Chord+Chord/(NChord*2);Span/2-Span/(NSpan*2);0])

%% check the location of the centroid for the first and last panel
assert_tol(vlm_wing.Normal(:,1),[0 0 -1]')
assert_tol(vlm_wing.Normal(:,end),[0 0 -1]')

%% check the area of each panel
assert_tol(vlm_wing.Area(1),(Span/NSpan) * (Chord/NChord))
assert_tol(vlm_wing.Area,vlm_wing.Area(1))

%% check the connectivity of port LE panel
assert(isnan(vlm_wing.Connectivity(1,1)))
assert(isnan(vlm_wing.Connectivity(4,1)))
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(2,1)) ,...
    vlm_wing.Nodes(:,vlm_wing.Panels(1,vlm_wing.Connectivity(2,1))));
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,1)) , ...
    vlm_wing.Nodes(:,vlm_wing.Panels(1,vlm_wing.Connectivity(3,1))));

%% check the connectivity of starboard LE panel
assert(isnan(vlm_wing.Connectivity(1,N/2 + NSpan/2)))
assert(isnan(vlm_wing.Connectivity(2,N/2 + NSpan/2)))

%% check the connectivity of port TE panel
assert(isnan(vlm_wing.Connectivity(3,N/2-NSpan/2+1)))
assert(isnan(vlm_wing.Connectivity(4,N/2-NSpan/2+1)))

%% check the connectivity of starboard TE panel
assert(isnan(vlm_wing.Connectivity(2,N)))
assert(isnan(vlm_wing.Connectivity(3,N)))
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(1,N)) , ...
    vlm_wing.Nodes(:,vlm_wing.Panels(4,vlm_wing.Connectivity(1,N))));
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,N)) , ...
    vlm_wing.Nodes(:,vlm_wing.Panels(3,vlm_wing.Connectivity(4,N))));

function assert_tol(test,val,varargin)
    assert(all(abs(test-val)<eps(test)*100),varargin{:})
end







