function [deriv] = deriv_lag(obj,t,U)
%DERIV Summary of this function goes here
%   Detailed explanation goes here
%     f = obj.get_f(U);
%     Q = obj.get_Q(U) + get_aero_Q(obj,U,t);
%     Q_c = obj.get_Q_c(U);
%     Q_lag = [f-Q;Q_c];
%     accels = obj.get_M_lag(U)\(-Q_lag);
    Q_ext =  get_Q_ext(obj,U(1:obj.DoFs*2,1),t);
    if Q_ext == 0
        accels = obj.get_M_lag(U)\(-obj.get_Q_lag(U));
    else
        Q_lag = obj.get_Q_lag(U);
        Q_ext_tmp = zeros(size(Q_lag));
        Q_ext_tmp(1:obj.DoFs) = Q_ext;
        accels = obj.get_M_lag(U)\(-(Q_lag-Q_ext_tmp));
    end
%     accels = obj.get_M_lag(U)\(-obj.get_Q_lag(U));
    qs = length(U)/2;
    deriv = [U(qs+1:end);accels(1:qs)];
end

