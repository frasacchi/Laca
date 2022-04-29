function obj = apply_result_filiment(obj,gamma,Fs,F_fil,V,rho)
obj.Gamma = gamma;
obj.V = V;
obj.F = Fs;
obj.Filiment_Force = F_fil;
%             if obj.useMEX
%                 [obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
%                     = laca.vlm.vlm_C_code('apply_result',Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
%             else
[obj.N,obj.D,obj.S,obj.L,obj.P,obj.Lprime,obj.Cp,obj.Cl,obj.Cd]...
    = laca.vlm.apply_result(Fs,V(obj.Centroid),obj.Normal,obj.Area,rho);
%             end
end