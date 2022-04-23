function [deriv] = deriv_UK(obj,t,U)
%DERIV Summary of this function goes here
%   Detailed explanation goes here
    M = obj.get_M(U);
    f = obj.get_f(U);
    Q = obj.get_Q(U) + get_Q_ext(obj,U,t);
    C_q = obj.get_C_q(U);
    Q_c = -obj.get_Q_c(U);

    M_inv = inv(M);
    M_inv_half = real(sqrtm(M_inv));
    
    D = C_q*M_inv_half;
    qdd_f = M\(Q-f);

    accels = qdd_f+M_inv_half*pinv(D)*(Q_c-C_q*qdd_f);
    deriv = [U(length(U)/2+1:end);accels];
end

