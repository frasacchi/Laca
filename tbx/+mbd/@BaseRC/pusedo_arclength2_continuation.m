function res = pusedo_arclength2_continuation(obj,Ui,params,p_idx,p_lim,p_dir,arc_step,Nmax,...
    p_names,RunStability,StopOnStability)
%CONTINUATION Summary of this function goes here
%   Detailed explanation goes here
ps = zeros(1,Nmax);
ps(1) = params(p_idx);
N = size(Ui,1);
Us = zeros(N,Nmax);
res = struct();

% get initial position
ps(1) = params(p_idx);
obj.set_parameters(params);
[Us(:,1),deriv] = find_equilibrium(obj,Ui,0);
if sum(abs(deriv))>1e-3
    error('could not find initial equilibirum position')
end
res = save_res(obj,res,1,Us(:,1),params,p_names,RunStability);
res(1).Equilbrium =  sum(abs(deriv))<1e-3;
i = 2;
isError = false;
while i<=Nmax && all(params(p_idx)<p_lim(:,2)') && all(params(p_idx)>p_lim(:,1)')
    if i == 2
        grad =  [zeros(N,1);p_dir];
        arc = norm(grad);
        grad = grad./arc;
    else
        grad = [Us(:,i-1)-Us(:,i-2);ps(:,i-1)-ps(:,i-2)];
        arc = norm(grad);
        grad = grad./arc;
    end
    stepsize =  arc_step.*grad;
    ps(:,i) = ps(:,i-1) + stepsize(N+1:end);
    params(p_idx) = ps(:,i);
    obj.set_parameters(params);
    Ui = Us(:,i-1) + stepsize(1:N);
    [Us(:,i),deriv] = find_equilibrium(obj,Ui,0);
    if sum(abs(deriv))>1e-3
        res(i-1).isEnd = isError;
        break;
    end
    res = save_res(obj,res,i,Us(:,i),params,p_names,RunStability);
    res(i).Equilbrium =  sum(abs(deriv))<1e-3;
    res(i).isEnd = false;
    if RunStability && StopOnStability && ~res(i).Stable
        break
    end
    i = i+1;
end
end

function [U,deriv] = find_equilibrium(obj,Ui,t)
    [U,deriv] = obj.find_equilibrium(Ui,t);
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

