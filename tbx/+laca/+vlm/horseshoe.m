function q = horseshoe(coords,p,gamma)
%VORTEX_RING calculates the induced velocity at point p from a horseshoe
%vortex specified by coords with strength gamma
%   coords is a (3,4) matrix which are the N verticies of the ring in a
%   clockwise order (start from LE inboard,e.g LE->LE->TE->TE)
idx = [4,1,2,3];
q = zeros(3,1);
for i = 1:3
   q = q + laca.vlm.vortex_line(coords(:,idx(i)),coords(:,idx(i+1)),p,gamma); 
end
end

