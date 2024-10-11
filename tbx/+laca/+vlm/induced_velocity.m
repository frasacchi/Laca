function V = induced_velocity(point,panels,ringNodes,teRings,teNodes,te_idx,gamma)
%GENERATE_AIC Summary of this function goes here
%   Detailed explanation goes here

N = size(panels,2);
V = zeros(size(point));
for j = 1:size(V,2)
    for i = 1:N
        coords = ringNodes(:,panels(:,i));
        V(:,j) = V(:,j) + laca.vlm.vortex_ring(coords,point(:,j),gamma(i));
    end
end

%compute influence of wake panels
for j = 1:size(V,2)
    for i = 1:size(te_idx,1)
        idx = te_idx(i,2);
        coords = teNodes(:,teRings(:,i));
        V(:,j) = V(:,j) + laca.vlm.horseshoe(coords,point(:,j),gamma(idx));
    end
end
end

