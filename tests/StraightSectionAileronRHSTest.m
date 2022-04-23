% this test generates a rectagular wing which is used to check:
% - vlm panels are generated in correct place
% - panel normals are correct
% - Panel Area is correct
% - Connectivity matrices are correct
%
% the wing is similar to that in 'StraightSectionTests' but includes 
% aileron panels. Wing properties are:
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
minSpan = Span/NSpan;


LE = [0 0 0;0 Span/2*(4/5) Span/2;0 0 0];
TE = LE;
TE(1,:) = -Chord;
ail = laca.model.RefControlSurf(2,[0.2,0.2],'ail');
wing = laca.model.Wing.From_RHS_LE_TE(LE,TE,ail);
vlm_wing = laca.vlm.Wing.From_laca_wing(wing,minSpan,NChord,false);

N = NChord*NSpan + 2*ceil(Span/2*(1/5)/minSpan);

% check the generated panels

%% check number of panels
assert(vlm_wing.NPanels == N,'Panel Number not NChord x NSpan')

%% check the location of Nodes ABCD for the first panel
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(1,1)),[0;-Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(2,1)),[0;-Span/2+Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(3,1)),[-Chord/NChord;-Span/2+Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,1)),[-Chord/NChord;-Span/2;0])

%% check the location of Nodes ABCD for the last panel (on wingtip)
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(1,end)),[-Chord+Chord/(NChord*2);Span/2-Span/NSpan;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(2,end)),[-Chord+Chord/(NChord*2);Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(3,end)),[-Chord;Span/2;0])
assert_tol(vlm_wing.Nodes(:,vlm_wing.Panels(4,end)),[-Chord;Span/2-Span/NSpan;0])

%% check the location of the centroid for the first and last panel
assert_tol(vlm_wing.Centroid(:,1),[-Chord/(NChord*2);-Span/2+Span/(NSpan*2);0])
assert_tol(vlm_wing.Centroid(:,end),[-Chord+Chord/(NChord*4);Span/2-Span/(NSpan*2);0])

%% check the normal vector of the first and last panel
assert_tol(vlm_wing.Normal(:,1),[0 0 -1]')
assert_tol(vlm_wing.Normal(:,end),[0 0 -1]')

%% check the area of each panel
main_area = (Span/NSpan) * (Chord/NChord);
ail_area = (Span/NSpan) * (Chord/(NChord*2));
assert_tol(vlm_wing.Area(1),main_area)
assert_tol(vlm_wing.Area(end),ail_area)


function assert_tol(test,val,varargin)
    assert(all(abs(test-val)<eps(test)*100),varargin{:})
end







