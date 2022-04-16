folder = fileparts(which('laca.vlm.gen_VLM_C'));
panels = coder.typeof(0,[4,inf],[0 1]); 
nodes = coder.typeof(0,[3,inf],[0 1]);
TeRings = coder.typeof(0,[4,3,inf],[0 0 1]);
te_idx = coder.typeof(0,[inf,2],[1 0]);
gamma = coder.typeof(0,[inf,1],[1 0]);
isTE = coder.typeof(true,[inf 1],[1 0]);

cfg = coder.config('mex');
cfg.TargetLang = 'C++';
cfg.InlineBetweenUserFunctions = 'Readability';
cfg.EnableAutoParallelization = 1;

vars = {'-o' fullfile(folder,'vlm_C_code') '-d' fullfile(folder,'codegen','mex','vlm_C_code')...
    '-config' 'cfg' '-report'};
vars = [vars(:)' {which('laca.vlm.vortex_line')} {'-args'} ...
    {{[0;0;0],[0;0;0],[0;0;0],1,1}}];
vars = [vars(:)' {which('laca.vlm.vortex_ring')} {'-args'} ...
    {{zeros(3,4),[0;0;0],1}}];
vars = [vars(:)' {which('laca.vlm.vortex_ring_split')} {'-args'} ...
    {{zeros(3,4),[0;0;0],1}}];
vars = [vars(:)' {which('laca.vlm.horseshoe')} {'-args'} ...
    {{zeros(3,4),[0;0;0],1}}];
vars = [vars(:)' {which('laca.vlm.panel_normal')} {'-args'} ...
    {{panels,nodes}}];
vars = [vars(:)' {which('laca.vlm.induced_velocity')} {'-args'} ...
    {{[0;0;0],panels,nodes,TeRings,te_idx,gamma}}];
vars = [vars(:)' {which('laca.vlm.generate_rings')} {'-args'} ...
    {{panels,nodes,isTE,[0;0;0]}}];
vars = [vars(:)' {which('laca.vlm.generate_AIC')} {'-args'} ...
    {{panels,nodes,nodes,nodes,TeRings,te_idx}}];
vars = [vars(:)' {which('laca.vlm.filiment_force')} {'-args'} ...
    {{panels,nodes,nodes,panels,gamma,gamma,1}}];

tic;
codegen(vars{:})
toc;