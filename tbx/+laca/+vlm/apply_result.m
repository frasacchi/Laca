function [N,D,S,L,P,Lprime,Cp,Cl,Cd] = apply_result(Fs,V,normal,area,rho)
    N = dot(normal,Fs)';
    u = vecnorm(V);
    V_dir = V./repmat(u,3,1);
    D = dot(V_dir,Fs)';
    S_dir = cross(V_dir,normal);
    S = dot(S_dir,Fs)';
    L_dir = cross(V_dir,S_dir);
    L = -dot(L_dir,Fs)';
    P = -N./area;
    Lprime = -N./area; 
    q = (0.5*rho*u.^2)';
    Cp = P./q;
    Cl = L./(q.*area);
    Cd = D./(q.*area);
end
