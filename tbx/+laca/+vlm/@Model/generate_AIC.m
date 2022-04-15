function obj = generate_AIC(obj)
% compute influence of wing panels
obj.AIC = laca.vlm.vlm_C_code('generate_AIC',obj.Rings,...
    obj.Collocation,obj.Normal,obj.TERings,obj.TEidx);
end

