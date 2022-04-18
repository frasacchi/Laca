% generate a rectangular wing model
LE = [0 0;0 5;0 0];
TE = LE;
TE(1,:) = -2;
wing = laca.model.Wing.From_LE_TE(LE,TE,[]);
model = laca.model.Aircraft(wing);
figure(1);clf;model.draw;
axis equal

% convert to VLM model
vlm_model = laca.vlm.Model.From_laca_model(model,1,1,true);
figure(2);clf;vlm_model.draw;
axis equal

% generate VLM rings
vlm_model = vlm_model.generate_rings();
vlm_model = vlm_model.generate_te_horseshoe([-2 0 0]');
figure(3);clf;vlm_model.draw_rings;
axis equal

% test solver
AoA = rad2deg(0.2);
Beta = 0;
V_func = fh.roty(-AoA)*fh.rotz(-Beta)*[-1 0 0]';
V_dir = V_func./vecnorm(V_func);
vlm_model = vlm_model.generate_te_horseshoe(V_dir.*[-2 0 0]');
vlm_model = vlm_model.generate_AIC();
vlm_model = vlm_model.solve(V_func,1.225);
Wrench = vlm_model.get_forces_and_moments([-0.08*0.25,0,0]');
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

test_AIC = [3.00407314926487	1.26432091316434	0.310026118748870	0.105508508594403	0.0466877160748436
1.26432091316434	3.00407314926487	1.26432091316434	0.310026118748870	0.105508508594403
0.310026118748866	1.26432091316434	3.00407314926487	1.26432091316434	0.310026118748870
0.105508508594407	0.310026118748866	1.26432091316434	3.00407314926487	1.26432091316434
0.0466877160748436	0.105508508594407	0.310026118748866	1.26432091316434	3.00407314926487];

test_Gamma = [49.7735506118903 26.6073987373980 33.4634155154852 26.6073987373979 49.7735506118903]';

test_Normal = [0	0	0	0	0; 0	0	0	0	0;-1	-1	-1	-1	-1];

assert(max(abs(vlm_model.Normal - test_Normal),[],'all')<1e-4,'Incorrect Normal Vectors')
assert(max(abs(vlm_model.AIC*1e3 - test_AIC),[],'all')<1e-4,'Incorrect AIC Matric')
assert(max(abs(vlm_model.Gamma - test_Gamma),[],'all')<1e-4,'Incorrect Gamma Matrix')

assert(abs(L--223.5787)<tol,'Incorrect Lift')


% run 
% AoAs = -5:5;
% Ls = zeros(size(AoAs));
% Ms = zeros(size(AoAs));
% %solve
% for i = 1:length(AoAs)
% AoA = AoAs(i);
% Beta = 0;
% V_func = fh.roty(-AoA)*fh.rotz(-Beta)*[-20 0 0]';
% vlm_model = vlm_model.generate_rings();
% V_dir = V_func./vecnorm(V_func);
% % for j = 1:size(vlm_model.TERings,3)
% %     vlm_model.TERings(3,:,j) = vlm_model.TERings(2,:,j) + V_dir' * 3;
% %     vlm_model.TERings(4,:,j) = vlm_model.TERings(1,:,j) + V_dir' * 3;
% % end
% vlm_model = vlm_model.generate_AIC();
% vlm_model = vlm_model.solve(V_func,1.225);
% Wrench = vlm_model.get_forces_and_moments([-0.08*0.25,0,0]');
% F = (fh.roty(-AoA)*fh.rotz(-Beta))'*Wrench(1:3);
% Ls(i) = F(3);
% Ms(i) = Wrench(5);
% end
% f = figure(4);clf;
% vlm_model.draw('param','P')
% f.CurrentAxes.ZDir = 'Reverse';
% ax = gca;
% ax.Clipping = 'off';
% axis equal
% 
% f = figure(5);hold on;%clf;
% plot(AoAs,Ls);




