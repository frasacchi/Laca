function out = panel_centroid(panels,nodes)
%get the four cardinal points of the box
A = nodes(:,panels(1,:));
B = nodes(:,panels(2,:));
C = nodes(:,panels(3,:));
D = nodes(:,panels(4,:));
out = (A+B+C+D)./4;
end
