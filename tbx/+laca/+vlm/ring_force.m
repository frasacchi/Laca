function [F,Fs] = ring_force(panels,ringNodes,Panel_Filiments,V,gamma,isTE,rho)
N = size(panels,2);
vec = ringNodes(:,panels([2,3,4,1],:))-ringNodes(:,panels);
V = V(:,repmat(1:N,4,1));
gamma = gamma(repmat(1:N,4,1));
gamma(3,isTE) = 0;
F = rho.*cross(vec,V).*gamma(:)';
Fs = zeros(3,N);
for i = 1:N
    Fs(:,i) = sum(F(:,Panel_Filiments(:,i)),2);
end
end