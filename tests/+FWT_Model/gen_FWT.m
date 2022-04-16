function [LE,TE,Masses] = gen_FWT(LE,chord,twist,flare,fold,varargin)
    p = inputParser;
    p.addParameter('Mass',laca.model.Mass.empty);
    p.parse(varargin{:})
    
    Masses = p.Results.Mass;

    centreline = LE + repmat([0.25,0,0]',1,length(chord)).*repmat(-chord,3,1);
    TE = zeros(size(LE));
    % adjust for setting angle 
    for i = 1:length(chord)
        LE(:,i) = centreline(:,i) + [cosd(twist(i));0;-sind(twist(i))]*chord(i)/4;
        TE(:,i) = centreline(:,i) - [cosd(twist(i));0;-sind(twist(i))]*chord(i)/4*3;
    end

    % ajdust wingtip for flare            
    panel_normal = cross(LE(:,end)-LE(:,end-1),LE(:,end)-TE(:,end)); 
    if panel_normal(3)>0
        panel_normal = panel_normal*-1;
    end
    hinge_axis = farg.geom.rotateAbout([1 0 0]',panel_normal,-flare);
    if hinge_axis(1)<0
        panel_normal = panel_normal*-1;
    end

    newLE = farg.geom.plane_line_intersect(cross(hinge_axis,panel_normal)',...
        mean([LE(:,1),TE(:,1)]'),...
        LE(:,1)',LE(:,2)');
    newTE = farg.geom.plane_line_intersect(cross(hinge_axis,panel_normal)',...
        mean([LE(:,1),TE(:,1)]'),...
        TE(:,1)',TE(:,2)');

    LE(:,1) = newLE;
    TE(:,1) = newTE; 

    % rotate the wingtip
    N = size(LE,2)-1;
    LE(:,2:end) = repmat(LE(:,1),1,N) + farg.geom.rotateAbout(LE(:,2:end)-repmat(LE(:,1),1,N),repmat(hinge_axis,1,N),-fold);
    TE(:,2:end) = repmat(TE(:,1),1,N) + farg.geom.rotateAbout(TE(:,2:end)-repmat(TE(:,1),1,N),repmat(hinge_axis,1,N),-fold);    
end

