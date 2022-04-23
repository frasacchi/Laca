function [AIC3D,AIC] = generate_AIC3D(panels,ringNodes,collocation,teRings,teNodes,te_idx)
%GENERATE_AIC Summary of this function goes here
%   Detailed explanation goes here
normal = laca.vlm.panel_normal(panels,ringNodes);
N = size(panels,2);
AIC3D = zeros(N,N,3);
for j = 1:N
    coords = ringNodes(:,panels(:,j));
    for i = 1:N
        v = laca.vlm.vortex_ring(coords,collocation(:,i),1);
        for k = 1:3
            AIC3D(i,j,k) = v(k);
        end
    end
end

%compute influence of wake panels
for i = 1:size(te_idx,1)
    idx = te_idx(i,2);
    coords = teNodes(:,teRings(:,i));
    for j = 1:N
        v = laca.vlm.vortex_ring(coords,collocation(:,j),1);
        for k = 1:3
            AIC3D(j,idx,k) = AIC3D(j,idx,k) + v(k);
        end
    end
end
AIC = sum(AIC3D.*repmat(reshape(normal',1,N,3),N,1,1),3);
end

