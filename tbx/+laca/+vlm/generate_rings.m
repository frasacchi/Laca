function [RingNodes,Normal,Collocation] = generate_rings(panels,nodes)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here

N = size(panels,2);
RingNodes = zeros(3,size(nodes,2));
Collocation = zeros(3,N);
for i = 1:N
    A = nodes(:,panels(1,i));
    B = nodes(:,panels(2,i));
    AD = nodes(:,panels(4,i))-A;
    BC = nodes(:,panels(3,i))-B;
    
    RingNodes(:,panels(1,i)) = A + 0.25*AD;
    RingNodes(:,panels(2,i)) = B + 0.25*BC;
    RingNodes(:,panels(3,i)) = B + 1.25*BC;
    RingNodes(:,panels(4,i)) = A + 1.25*AD;
    
    Collocation(:,i) = ((A + 0.75*AD) + (B + 0.75*BC))./2';    
end
Normal = laca.vlm.panel_normal(panels,RingNodes);
end

