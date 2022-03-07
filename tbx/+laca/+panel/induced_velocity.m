function V = induced_velocity(point,rings,te_rings,te_idx,gamma)
%GENERATE_AIC Summary of this function goes here
%   Detailed explanation goes here
N = size(rings,3);
V = zeros(3,1);
for i = 1:N
    coords = rings(:,:,i)';
    V = V + laca.panel.vortex_ring(coords,point,gamma(i));
end

%compute influence of wake panels
for i = 1:size(te_idx,1)
    idx = te_idx(i,2);
    coords = te_rings(:,:,i)';
    V = V + laca.panel.vortex_ring(coords,point,gamma(idx));
end
end

