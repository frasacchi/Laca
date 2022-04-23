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
M = sum(cross(arm-repmat(p(:),1,size(obj.F,2)),F_tmp),2);
res = [F_wings;M];
end
