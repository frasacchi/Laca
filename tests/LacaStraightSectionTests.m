Span = 1;
NSpan = 20;
NChord = 5;
Chord = 0.1;

LE = [0 0;-Span/2 Span/2;0 0];
TE = LE;
TE(1,:) = -Chord;
wing = laca.model.Wing.From_LE_TE(LE,TE,[]);
sec = laca.vlm.Section.From_laca_section(wing.WingSections(1),Span/NSpan,NChord,true);

N = NChord*NSpan;

%% check the generated panels
% check number of panels
assert(sec.NPanels == N,'Panel Number not NChord x NSpan')

% check the location of Nodes ABCD for the first panel
assert_tol(sec.Nodes(:,sec.Panels(1,1)),[0;-Span/2;0])
assert_tol(sec.Nodes(:,sec.Panels(2,1)),[0;-Span/2+Span/NSpan;0])
assert_tol(sec.Nodes(:,sec.Panels(3,1)),[-Chord/NChord;-Span/2+Span/NSpan;0])
assert_tol(sec.Nodes(:,sec.Panels(4,1)),[-Chord/NChord;-Span/2;0])

% check the location of Nodes ABCD for the last panel
assert_tol(sec.Nodes(:,sec.Panels(1,end)),[-Chord+Chord/NChord;Span/2-Span/NSpan;0])
assert_tol(sec.Nodes(:,sec.Panels(2,end)),[-Chord+Chord/NChord;Span/2;0])
assert_tol(sec.Nodes(:,sec.Panels(3,end)),[-Chord;Span/2;0])
assert_tol(sec.Nodes(:,sec.Panels(4,end)),[-Chord;Span/2-Span/NSpan;0])

% check the location of the centroid for the first and last panel
assert_tol(sec.Centroid(:,1),[-Chord/(NChord*2);-Span/2+Span/(NSpan*2);0])
assert_tol(sec.Centroid(:,end),[-Chord+Chord/(NChord*2);Span/2-Span/(NSpan*2);0])

% check the location of the centroid for the first and last panel
assert_tol(sec.Normal(:,1),[0 0 -1]')
assert_tol(sec.Normal(:,end),[0 0 -1]')

% check the area of each panel
assert_tol(sec.Area(1),(Span/NSpan) * (Chord/NChord))
assert_tol(sec.Area,sec.Area(1))

% check the connectivity of port LE panel
assert(isnan(sec.Connectivity(1,1)))
assert(isnan(sec.Connectivity(4,1)))

% check the connectivity of starboard LE panel
assert(isnan(sec.Connectivity(1,NSpan)))
assert(isnan(sec.Connectivity(2,NSpan)))

% check the connectivity of port TE panel
assert(isnan(sec.Connectivity(3,N-NSpan+1)))
assert(isnan(sec.Connectivity(4,N-NSpan+1)))

% check the connectivity of starboard TE panel
assert(isnan(sec.Connectivity(2,N)))
assert(isnan(sec.Connectivity(3,N)))


% check the connectivity of port LE panel
assert_tol(sec.Nodes(:,sec.Panels(2,1)) ,...
    sec.Nodes(:,sec.Panels(1,sec.Connectivity(2,1))));
assert_tol(sec.Nodes(:,sec.Panels(4,1)) , ...
    sec.Nodes(:,sec.Panels(1,sec.Connectivity(3,1))));


% check the connectivity of starboard TE panel
assert_tol(sec.Nodes(:,sec.Panels(1,N)) , ...
    sec.Nodes(:,sec.Panels(4,sec.Connectivity(1,N))));
assert_tol(sec.Nodes(:,sec.Panels(4,N)) , ...
    sec.Nodes(:,sec.Panels(3,sec.Connectivity(4,N))));


function assert_tol(test,val,varargin)
    assert(all(abs(test-val)<eps(test)*100),varargin{:})
end







