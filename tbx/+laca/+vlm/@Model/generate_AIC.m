function obj = generate_AIC(obj)
% compute influence of wing panels
% obj.AIC = laca.vlm.vlm_C_code('generate_AIC',obj.Panels,...
%     obj.RingNodes,obj.Collocation,obj.Normal,obj.TERings,obj.TENodes,obj.TEidx);
obj.AIC = laca.vlm.generate_AIC(obj.Panels,...
    obj.RingNodes,obj.Collocation,obj.Normal,obj.TERings,obj.TENodes,obj.TEidx);
end

