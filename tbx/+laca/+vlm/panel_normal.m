function out = panel_normal(panels,nodes)
    %get the four cardinal points of the box 
    A = nodes(:,panels(1,:));
    B = nodes(:,panels(2,:));
    C = nodes(:,panels(3,:));
    D = nodes(:,panels(4,:));
    out = cross(C-A,B-D);
    out = out ./ vecnorm(out);
end

