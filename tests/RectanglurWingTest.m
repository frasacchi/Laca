% generate a rectangular wing model
LE = [0 0 0;0 0.25 0.5;0 0 0];
TE = LE;
TE(1,:) = -0.08;
wing = laca.model.Wing.From_RHS_LE_TE(LE,TE,[]);
model = laca.model.Aircraft(wing);
figure(1);clf;model.draw;
axis equal

% convert to VLM model
vlm_model = laca.vlm.Model.From_laca_model(model,0.025,5,true);
figure(2);clf;vlm_model.draw;
axis equal

% generate VLM rings
vlm_model = vlm_model.generate_rings([-4 0 0]');
figure(3);clf;vlm_model.draw_rings;
axis equal

% test solver
AoA = 5;
Beta = 0;
V_func = fh.roty(-AoA)*fh.rotz(-Beta)*[-20 0 0]';
V_dir = V_func./vecnorm(V_func);
vlm_model = vlm_model.generate_rings([-4 0 0]');
% for j = 1:size(vlm_model.TERings,3)
%     vlm_model.TERings(3,:,j) = vlm_model.TERings(2,:,j) + V_dir' * 3;
%     vlm_model.TERings(4,:,j) = vlm_model.TERings(1,:,j) + V_dir' * 3;
% end
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
assert(abs(L-8.7302)<tol,'Incorrect Lift')



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




