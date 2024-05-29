function [evs,evec,j] = get_stability(p,U,t) %#codegen
    % call the solver
    j = mbd.jacobiancd(@(x)p.deriv_UK(t,x),U);
    [evec,D] = eig(j);
    evs = diag(D);
end