function obj = generate_rings(obj)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here
% 
% [obj.RingNodes,obj.Normal,obj.Collocation] = ...
%     laca.vlm.vlm_C_code('generate_rings',obj.Panels,obj.Nodes,obj.isTE,dir);

[obj.RingNodes,obj.Normal,obj.Collocation] = ...
    laca.vlm.generate_rings(obj.Panels,obj.Nodes);
end

