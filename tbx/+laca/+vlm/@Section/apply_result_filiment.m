function obj = apply_result_filiment(obj,gamma,Fs,V,rho)
obj.Gamma = gamma;
obj.V = V;
obj.F = Fs;
%             if obj.useMEX
%                 [obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
%                     = laca.vlm.vlm_C_code('apply_result',Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
%             else
[obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
    = laca.vlm.apply_result(Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
%             end
end