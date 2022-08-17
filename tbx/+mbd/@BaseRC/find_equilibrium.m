function [y,deriv] = find_equilibrium(obj,y,t)
%ENFORCE_CONSTRAINTS Summary of this function goes here
%   Detailed explanation goes here
Xs = length(y);
qs = Xs/2;
q_idx = 1:qs;

options = optimoptions('fsolve','Algorithm','levenberg-marquardt','Display','off');
[delta_q,~,~,~,~] = fsolve(@(x)cost(obj,x,y,t,q_idx),zeros(size(y(q_idx))),options);

y(q_idx) = y(q_idx) + delta_q;
deriv = obj.deriv(0,y);
end

function V = cost(obj,delta_X,y,t,X_idx)
y(X_idx) = y(X_idx) + delta_X;
V = obj.deriv(t,y);
end
