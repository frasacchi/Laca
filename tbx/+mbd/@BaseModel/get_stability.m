function [evs,vecs] = get_stability(p,U,t) %#codegen
    % call the solver
    j = p.get_jacobian(U,t);
    [vecs,D] = eig(j);
    evs = diag(D);
end