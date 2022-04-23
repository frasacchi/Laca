function y = find_pose(obj,y,idx_d) %#codegen
%ENFORCE_CONSTRAINTS Summary of this function goes here
%   Detailed explanation goes here
Xs = length(y);
qs = Xs/2;
% if  ~exist('idx_d','var') || isempty(idx_d)
if  isempty(idx_d)
    C_q = obj.get_C_q(y,p);
    [~,idx_i] = licols(C_q,1e-4);
    idx_d = ismember(1:size(C_q,2),idx_i);
end
idx_i = ~idx_d;
q_idx = 1:qs;
qd_idx = qs+1:Xs;
q = y(q_idx);
qd = y(qd_idx);

% enforce constraints get dependent displacements
options = optimoptions('fsolve','SpecifyObjectiveGradient',true,...
    'Display','off','Algorithm','levenberg-marquardt');
% options = optimoptions('fsolve','SpecifyObjectiveGradient',true,...
%     'Algorithm','levenberg-marquardt');
[x2,~,~,~] = fsolve(@(x)cost_function(obj,x,y,q,idx_d,q_idx),...
    zeros(size(q(idx_d))),options);
q(idx_d) = q(idx_d)+x2;
y(q_idx) = q;

%get dependent velocities
C_t = obj.get_C_t(y);
C_q = obj.get_C_q(y);
C_qi = C_q(:,idx_i);
C_qd = C_q(:,idx_d);
C_di = -C_qd\C_qi;
q_di = C_di*qd(idx_i)-C_qd\(C_q*qd+C_t);
qd(idx_d) = q_di;
y(qd_idx) = qd;
end

function [out,d_out] = cost_function(obj,delta_q,y,q,idx_d,q_idx)
    q(idx_d) = q(idx_d) + delta_q;
    y(q_idx) = q;
    out = obj.get_C(y);
    C_q = obj.get_C_q(y);
    d_out = C_q(:,idx_d);
end