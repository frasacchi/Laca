% this test generates a simple wing which is used to check:
% - generated AIC matrix
% - gamma / Lift produced 
% wing properties are
% - Span = 5m
% - Chord = 2m
% - Spanwise Panels = 5
% - Chordwise Panels = 1
%
% author: Fintan healy      Date: 19/04/2022
% email: fintan.healy@bristol.ac.uk

% generate a rectangular wing model
LE = [0 0;0 5;0 0];
TE = LE;
TE(1,:) = -2;
wing = laca.model.Wing.From_LE_TE(LE,TE,{});
model = laca.model.Aircraft({wing});
figure(1);clf;model.draw;
axis equal

% convert to VLM model
vlm_model = laca.vlm.Model.From_laca_model(model,1,1,true);
figure(2);clf;vlm_model.draw;
axis equal

% generate VLM rings
vlm_model = vlm_model.generate_rings();

AoA = rad2deg(0.2);
Beta = 0;
V_func = fh.roty(-AoA)*fh.rotz(-Beta)*[-1 0 0]';
V_dir = V_func./vecnorm(V_func);

vlm_model = vlm_model.generate_te_horseshoe(V_dir.*10);
figure(3);clf;vlm_model.draw_rings;
axis equal

% test solver
vlm_model.generate_AIC3D();
vlm_model.solve(V_func);
vlm_model.apply_result_katz(1.225);
Wrench = vlm_model.get_forces_and_moments([-2*0.25,2.5,0]');
F = (fh.roty(-AoA)*fh.rotz(-Beta))'*Wrench(1:3);
L= F(3);
f = figure(4);clf;
vlm_model.draw('param','P');
f.CurrentAxes.ZDir = 'Reverse';
ax = gca;
ax.Clipping = 'off';
axis equal
tol = 1e-2;

% vlm_model.AIC*1e3

test_AIC = [-674.159616106420	188.206901459960	30.8231673126208	11.6986702358531	5.96820752253094
188.206901459960	-674.159616106420	188.206901459960	30.8231673126208	11.6986702358531
30.8231673126208	188.206901459960	-674.159616106420	188.206901459960	30.8231673126208
11.6986702358531	30.8231673126208	188.206901459960	-674.159616106420	188.206901459960
5.96820752253094	11.6986702358531	30.8231673126208	188.206901459960	-674.159616106420];

test_Gamma = [-0.536976974065805	-0.688745041639893	-0.728351449210465	-0.688745041639893	-0.536976974065805]';

test_Normal = [0	0	0	0	0; 0	0	0	0	0;-1	-1	-1	-1	-1];


%% ensure panel normals are correct
assert(max(abs(vlm_model.Normal - test_Normal),[],'all')<1e-4,'Incorrect Normal Vectors')

%% Check AIC Matrix
assert(max(abs(vlm_model.AIC*1e3 - test_AIC),[],'all')<1e-4,'Incorrect AIC Matric')

%% Check calculated Gamma Vector
assert(max(abs(vlm_model.Gamma - test_Gamma),[],'all')<1e-4,'Incorrect Gamma Matrix')

%% Check Total Lift produced
assert(abs(L--3.7415)<tol,'Incorrect Lift')




