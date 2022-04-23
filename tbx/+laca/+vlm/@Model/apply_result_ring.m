function obj = apply_result_ring(obj,rho)
if isempty(obj.Gamma)
    error('VLM model must first be solved to apply result')
end
Vi = pagemtimes(obj.AIC3D,obj.Gamma);
obj.V_i = reshape(Vi,[],3)' + obj.V_col;
if obj.useMEX
    obj.Filiment_Force = laca.vlm.vlm_C_code('ring_force',obj.Panels,obj.Nodes,...
        obj.V_i,obj.Gamma,obj.isTE,rho);
else
    obj.Filiment_Force = laca.vlm.ring_force(obj.Panels,obj.Nodes,...
        obj.V_i,obj.Gamma,obj.isTE,rho);
end
Fs = zeros(3,size(obj.Panels,2));
for i = 1:obj.NPanels
    Fs(:,i) = sum(obj.Filiment_Force(:,obj.Panel_Filiments(:,i)),2);
end
idx = 1;
for i = 1:length(obj.Wings)
    N = obj.Wings(i).NPanels;
    obj.Wings(i) = obj.Wings(i).apply_result_filiment(...
        obj.Gamma(idx:idx+N-1),Fs(:,idx:idx+N-1),obj.V,rho);
    idx = idx + N;
end
obj.HasKatzResult = false;
obj.HasFilResult = true;
end
