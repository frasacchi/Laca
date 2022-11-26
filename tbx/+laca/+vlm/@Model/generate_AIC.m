function obj = generate_AIC(obj)
% compute influence of wing panels
if obj.useMEX
    obj.AIC = laca.vlm.vlm_C_code('generate_AIC',obj.Panels,...
        obj.RingNodes,obj.Collocation,obj.TERings,obj.TENodes,obj.TEidx,obj.XZ_sym);
else
    obj.AIC = laca.vlm.generate_AIC(obj.Panels,...
        obj.RingNodes,obj.Collocation,obj.TERings,obj.TENodes,obj.TEidx,obj.XZ_sym);
end
end

