function res = natural_continuation(obj,Ui,params,p_max,p_idx,stepsize,p_names,RunStability,StopOnStability)
%CONTINUATION Summary of this function goes here
%   Detailed explanation goes here
N = ceil((p_max-params(p_idx))/stepsize)+1;
us = linspace(0,p_max,N);
Us = zeros(size(Ui,1),N);
res = struct();
for i = 1:length(us)
    % use backward diffence to estimate the velocity and add it to estimate
    % for next position
    if i > 2
        Ui = (Us(:,i-1)-Us(:,i-2)) + Us(:,i-1);
    end
    % use backward diffence to estimate the acceleration and add it to
    % estimate for next position
    if i > 3
        Ui = Ui + 0.5 *(Us(:,i-1) - 2*(Us(:,i-2)) + Us(:,i-3));
    end
    params(p_idx) = us(i);
    obj.set_parameters(params);
    [Us(:,i),deriv] = obj.find_equilibrium(Ui,0);
    Ui = Us(:,i);
    res = save_res(obj,res,i,Ui,params,p_names,RunStability);
    res(i).Equilbrium =  sum(abs(deriv))<1e-3;
    if RunStability && StopOnStability && ~res(i).Stable
        break
    end
end
end

function res = save_res(obj,res,i,U,params,p_names,RunStability)
    for j = 1:length(params)
        res(i).(p_names(j)) = params(j);
    end
    res(i).params = params;
    res(i).U = U;
    if RunStability
        evs = obj.get_stability(res(i).U,0);
        res(i).evs =  unique(complex(real(evs),abs(imag(evs))));
        res(i).Stable = ~any(real(evs)>1e-2);
    end
end

