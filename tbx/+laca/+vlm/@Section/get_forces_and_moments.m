function res = get_forces_and_moments(obj,p,local)
%get_forces_and_moments get forces and moments about point p
if local
    F_tmp = obj.Rot'*obj.F;
    arm = obj.Rot'*(obj.Collocation - repmat(obj.R,1,size(obj.F,2)));
else
    F_tmp = obj.F;
    arm = obj.Collocation;
end
F_wings = sum(F_tmp,2);
if obj.useMEX
    M = laca.vlm.vlm_C_code('get_moment',F_tmp,arm,p(:));
else
    M = laca.vlm.get_moment(F_tmp,arm,p(:));
end
res = [F_wings;M];
end
