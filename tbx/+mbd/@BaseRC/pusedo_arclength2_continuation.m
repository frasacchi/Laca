function res = pusedo_arclength2_continuation(obj,Ui,params,p_idx,p_lim,p_dir,min_step,max_step,arc_step,Nmax,...
    p_names,RunStability,StopOnStability)
%CONTINUATION Summary of this function goes here
%   Detailed explanation goes here
ps = zeros(1,Nmax);
errs = zeros(1,Nmax);
ps(1) = params(p_idx);
N = size(Ui,1);
Us = zeros(N,Nmax);
res = struct();

delta_step = (max_step - min_step)*0.1;

% get initial position
ps(1) = params(p_idx);
obj.set_parameters(params);
[Us(:,1),deriv] = find_equilibrium(obj,Ui,0);
if sum(abs(deriv))>1e-3
    error('could not find initial equilibirum position')
end
res = save_res(obj,res,1,Us(:,1),params,p_names,RunStability);
res(1).Equilbrium =  sum(abs(deriv))<1e-3;
res(1).isEnd = false;
i = 2;
isError = false;
while i<=Nmax
    if i>2 && (any(params(p_idx)>=p_lim(:,2)') || any(params(p_idx)<=p_lim(:,1)'))
        break
    end
    if i == 2
        grad =  [zeros(N,1);p_dir];
        arc = norm(grad);
        grad = grad./arc;
    else
        grad = [Us(:,i-1)-Us(:,i-2);ps(:,i-1)-ps(:,i-2)];
        arc = norm(grad);
        grad = grad./arc;
    end
    while true
        stepsize =  arc_step.*grad;
        %set paremeters
        ps(:,i) = min(max(ps(:,i-1) + stepsize(N+1:end),p_lim(:,1)),p_lim(:,2));
        params(p_idx) = ps(:,i);
        obj.set_parameters(params);
        %find equilibrium position
        Ui = Us(:,i-1) + stepsize(1:N);
        [Us(:,i),deriv] = obj.find_equilibrium(Ui,0);
        errs(i) = norm(Ui - Us(:,i))./norm(stepsize(1:N));
        if isinf(errs(i))
            errs(i) = nan;
        end
        %first check we have found an equilbrium position
        if sum(abs(deriv))>1e-3 || errs(i)>3
            if arc_step == min_step
                % try from last known position
                [Us(:,i),deriv] = obj.find_equilibrium(Us(:,i-1),0);
                errs(i) = norm(Ui - Us(:,i))./norm(stepsize(1:N));
                if sum(abs(deriv))>1e-3
                    res(end).isEnd = true;
                    return
                else
                    break;
                end
            else
                arc_step = max(arc_step - delta_step, min_step);
            end
        else
            arc_step = min(arc_step + delta_step, max_step);
            break;
        end
    end
    res = save_res(obj,res,i,Us(:,i),params,p_names,RunStability);
    res(i).Equilbrium =  sum(abs(deriv))<1e-3;
    res(i).isEnd = false;
    if RunStability && StopOnStability && ~res(i).Stable
        break
    end
    i = i+1;
end
res(end).isEnd = true;
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
    %save additional outputs
    [~,a_out] = obj.set_additional_outputs(U,0);
    fn = fieldnames(a_out);
    for j = 1:length(fn)
        res(i).(fn{j}) = a_out.(fn{j});
    end
end

