function y = enforce_constraints(obj,y)
%ENFORCE_CONSTRAINTS Summary of this function goes here
%   Detailed explanation goes here
Xs = length(y);
qs = Xs/2;
% if  ~exist('idx_d','var') || isempty(idx_d)
    C_q = obj.get_C_q(y);
    [~,idx_i] = mbd.licols(C_q,1e-4);
    idx_d = ismember(1:size(C_q,2),idx_i);
% end
idx_i = ~idx_d;
q_idx = 1:qs;
qd_idx = qs+1:Xs;
q = y(q_idx);
qd = y(qd_idx);

% enforce constraints get dependent displacements
C = obj.get_C(y);
err = C'*C;
while err>1e-10
    C_q = obj.get_C_q(y);
    C_qd = C_q(:,idx_d);
    % use newton rapshon to find the required change in dependent coords
    delta_qd =  C_qd\C;
    q(idx_d) = q(idx_d)-delta_qd;
    y(q_idx) = q;
    C = obj.get_C(y);
    err = C'*C;
end

%get dependent velocities
C_t = obj.get_C_t(y);
C_q = obj.get_C_q(y);
C_qi = C_q(:,idx_i);
C_qd = C_q(:,idx_d);
C_di = -C_qd\C_qi;
q_di = C_di*qd(idx_i)-C_qd\C_t;
qd(idx_d) = q_di;
y(qd_idx) = qd;
end