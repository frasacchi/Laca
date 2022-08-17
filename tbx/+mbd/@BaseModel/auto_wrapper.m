% AUTO function file for running your model
function [f,o,dfdu,dfdp,varargout]=auto_wrapper(obj,par,u,~)
%
% function file for your model
%
f=[];       % derivative values, same size as Ndim
o=[];       % additional outputs, size automatically detected
dfdu=[];    % user-defined derivatives for states, this parameter empty when Jac=0
dfdp=[];    % user-defined derivatives for parameters, this parameter empty when Jac=0

obj.set_parameters(par);
obj.set_constants(u);
f = obj.deriv(0,u); % call of the model you want to do continuation with, with the params loaded
o = obj.set_additional_outputs(u,0);

% Label generating routine for my function aplot. Call this function with an extra out
% argument to get the labels. Done in columns [parameters states outputs].
if nargout>4
    param_names = obj.param_names;
    state_names = obj.state_names;
    output_names = obj.output_names;
    for i = 1:length(param_names)
        labels{i,1}= param_names(i);
    end
    for i = 1:length(state_names)
        labels{i,2}= state_names(i);
    end
    for i = 1:length(output_names)
        labels{i,3}= output_names(i);
    end
    if ~isempty(labels)
        varargout{1}=labels;
    end
end
end
