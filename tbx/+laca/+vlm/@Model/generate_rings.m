function obj = generate_rings(obj,dir)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here
% 
% [obj.RingNodes,obj.Normal,obj.Collocation,obj.TERings,obj.TEidx] = ...
%     laca.vlm.vlm_C_code('generate_rings',obj.Panels,obj.Nodes,obj.isTE,dir);

[obj.RingNodes,obj.Normal,obj.Collocation,obj.TERings,obj.TEidx] = ...
    laca.vlm.generate_rings(obj.Panels,obj.Nodes,obj.isTE,dir);
end

