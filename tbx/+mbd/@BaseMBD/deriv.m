function [deriv] = deriv(obj,t,U)
%DERIV Summary of this function goes here
%   Detailed explanation goes here
    accels = obj.get_M(U)\(obj.get_Q(U) + get_Q_ext(obj,U,t)-obj.get_f(U));
    deriv = [U(length(accels)+1:end);accels];
end

