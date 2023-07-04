function [y,deriv] = find_equilibrium(obj,y,t,opts)
arguments
    obj
    y
    t
    opts.q_idx = 1:obj.DoFs
    opts.out_idx = 1:(obj.DoFs*2)
end
%ENFORCE_CONSTRAINTS Summary of this function goes here
%   Detailed explanation goes here
options = optimoptions('fsolve','Algorithm','levenberg-marquardt','Display','off');
[delta_q,~,~,~,~] = fsolve(@(x)cost(obj,x,y,t,opts.q_idx,opts.out_idx),zeros(size(y(opts.q_idx))),options);

y(opts.q_idx) = y(opts.q_idx) + delta_q;
deriv = obj.deriv(0,y);
end

function V = cost(obj,delta_X,y,t,X_idx,out_idx)
y(X_idx) = y(X_idx) + delta_X;
V = obj.deriv(t,y);
V = V(out_idx);
end
