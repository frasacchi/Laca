function res = arclength_continuation(obj,Ui,params,p_idx,p_lim,p_dir,p_max_step,p_min_step,max_arclength,Nmax,...
    p_names,RunStability,StopOnStability)
%CONTINUATION Summary of this function goes here
%   Detailed explanation goes here
ps = zeros(1,Nmax);
ps(1) = params(p_idx);
Us = zeros(size(Ui,1),Nmax);
res = struct();

% get initial position
ps(1) = params(p_idx);
obj.set_parameters(params);
[Us(:,1),deriv] = obj.find_equilibrium(Ui,0);
if sum(abs(deriv))>1e-3
    error('could not find initial equilibirum psotion')
end
res = save_res(obj,res,1,Us(:,1),params,p_names,RunStability);
res(1).Equilbrium =  sum(abs(deriv))<1e-3;

i = 2;
arclength = max_arclength;
factor = 1;
while i<=Nmax && params(p_idx)<p_lim(2) && params(p_idx)>p_lim(1)
    if i > 2
        delta_p = (ps(i-1)-ps(i-2));
        grad = (Us(:,i-1)-Us(:,i-2))./delta_p;
        grad = norm(grad) * delta_p./abs(delta_p);
    else
        grad = p_dir*1e-3;
    end
    err = 0.5;
    Niter = 1;
    while err>0.25
        if Niter > 200
            err('Stuck in loop')
        end
        stepsize = arclength*factor/grad;
        p_dir = stepsize./abs(stepsize);
        stepsize = min(p_max_step,abs(stepsize));
        stepsize = max(p_min_step,stepsize)*p_dir;
        ps(i) = ps(i-1)+stepsize;
        ps(i) = min(ps(i),p_lim(2));
        ps(i) = max(ps(i),p_lim(1));
        params(p_idx) = ps(i);
        obj.set_parameters(params);
        [Us(:,i),deriv] = obj.find_equilibrium(Us(:,i-1),0);
        err = norm(Us(:,i)-Us(:,i-1))./arclength -1;
        if err > 0.25
%             if (arclength*factor/grad) >= p_min_step
                factor = factor./2;
%             end
            if abs(stepsize) == p_min_step
                err = 0;
            end
        else
            if (arclength*factor/grad) <= p_max_step
                factor = factor.*2;
            end
        end
        Niter = Niter + 1;
    end
    res = save_res(obj,res,i,Us(:,i),params,p_names,RunStability);
    res(i).Equilbrium =  sum(abs(deriv))<1e-3;
    if RunStability && StopOnStability && ~res(i).Stable
        break
    end
    i = i+1;
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

