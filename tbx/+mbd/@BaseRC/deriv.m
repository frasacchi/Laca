% function [deriv] = deriv(obj,t,U)
% %DERIV Summary of this function goes here
% %   Detailed explanation goes here
    
%     obj.set_constants(U);
%     accels = obj.get_M(U)\(obj.get_Q(U) + get_Q_ext(obj,U,t)-obj.get_f(U));
%     deriv = [U(length(accels)+1:end);accels];
% end

function [deriv] = deriv(obj,t,U)
    %DERIV Summary of this function goes here
    %   Detailed explanation goes here
    obj.set_constants(U);
    M = obj.get_M(U);
    Q = obj.get_Q(U);
    f = obj.get_f(U);
    Q_ext = get_Q_ext(obj,U,t);
    idx = obj.active_DoFs;

    accels = M(idx,idx)\(Q(idx) + Q_ext(idx) - f(idx));
    q_dot = zeros(obj.DoFs, 1); q_ddot = zeros(obj.DoFs, 1);
    q_dot(idx) = U(obj.DoFs + idx); q_ddot(idx) = accels;
    deriv = [q_dot; q_ddot];
end
