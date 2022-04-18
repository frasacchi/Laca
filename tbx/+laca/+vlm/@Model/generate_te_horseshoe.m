function obj = generate_te_horseshoe(obj,dir)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here
% 
% [obj.TENodes,obj.TERings,obj.TEidx] = ...
%     laca.vlm.vlm_C_code('generate_te_horseshoe',obj.Panels,obj.Nodes,obj.isTE,dir);

[obj.TENodes,obj.TERings,obj.TEidx] = ...
    laca.vlm.generate_te_horseshoe(obj.Panels,obj.Nodes,obj.isTE,dir);
end

