function out = panel_area(panels,nodes)
%get the four cardinal points of the box
A = nodes(:,panels(1,:));
B = nodes(:,panels(2,:));
C = nodes(:,panels(3,:));
D = nodes(:,panels(4,:));
out = 0.5*(vecnorm(cross(B-A,D-A)) + vecnorm(cross(B-C,D-C)))';
end

