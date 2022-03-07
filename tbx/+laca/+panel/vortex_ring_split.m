function q = vortex_ring_split(coords,p,gamma)
%VORTEX_RING calculates the induced velocity at point p from a vortix ring
%specified by coords with strength gamma
%   coords is a (3,N) matrix which are the N verticies of the ring in a
%   clockwise order
n_vert = size(coords,2);
idx = [1:n_vert,1];
q = zeros(3,4);
for i = 1:n_vert
   q(:,i) = laca.panel.vortex_line(coords(:,idx(i)),coords(:,idx(i+1)),p,gamma); 
end
end

