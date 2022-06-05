function res = get_forces_and_moments(obj,p,local)
%get_forces_and_moments get forces and moments about point p
res = zeros(6,1);
for i = 1:length(obj.Sections)
    res = res + obj.Sections{i}.get_forces_and_moments(p,local);
end
end
