function Collocation = get_collocation(panels,nodes,dC_l_dalpha)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here

N = size(panels,2);
Collocation = zeros(3,N);
r = 1/4 + dC_l_dalpha./(4*pi);
for i = 1:N
    A = nodes(:,panels(1,i));
    B = nodes(:,panels(2,i));
    AD = nodes(:,panels(4,i))-A;
    BC = nodes(:,panels(3,i))-B;
    Collocation(:,i) = ((A + r(i)*AD) + (B + r(i)*BC))./2';    
end
end

