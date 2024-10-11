function F = filiment_force(panels,ringNodes,V,gamma,isTE,rho)

N = size(panels,2);
vec = ringNodes(:,panels([2,3,4,1],:))-ringNodes(:,panels);
% V = V(:,repmat(1:N,4,1));
gamma = gamma(repmat(1:N,4,1));
gamma(3,isTE) = 0;
F = rho.*cross(vec,V).*gamma(:)';

end