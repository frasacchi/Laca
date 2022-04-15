function out = panel_normal(Panels)
    %get the four cardinal points of the box
    N = reshape((Panels(1,:,:)+Panels(2,:,:))./2,3,[]);
    E = reshape((Panels(2,:,:)+Panels(3,:,:))./2,3,[]);
    S = reshape((Panels(3,:,:)+Panels(4,:,:))./2,3,[]);
    W = reshape((Panels(4,:,:)+Panels(1,:,:))./2,3,[]);
    out = cross(S-N,E-W);
    out = out./repmat(sqrt(sum(out.^2,1)),3,1);

%             for i = 1:obj.NPanels
%                n = cross(...
%                    (obj.Panels(3,:,i)-obj.Panels(3,:,i))',...
%                    (obj.Panels(2,:,i)-obj.Panels(4,:,i))'...
%                    ); 
%                out(:,i) = n/norm(n);
%             end
end

