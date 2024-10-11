function out = panel_compass(panels,nodes)
    %get the four cardinal points of the box
    ABCD = nodes(:,panels);
    BCDA = nodes(:,panels([2,3,4,1],:));
    out = ABCD + (BCDA-ABCD)./2;
end

