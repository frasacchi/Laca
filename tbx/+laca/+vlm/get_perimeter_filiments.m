function [filiment_pos,ids] = get_perimeter_filiments(panels,ringNodes,tol,isTE)
% GET_PERIMETER_FILIMENTS get the indices of filiments that lie on the
% periemter of each panel
% get_perimeter_filiments returns the matrix ids, where each column
% represents the indiceis of the filiments that lie on the perimeter of the
% i'th panel. filiment_pos has a size 3x(N*4) where n is the number of
% panels and represent the centre of each filiment of each panel (North,East,South,West etc...)

NPanels = size(panels,2);
filiment_pos = laca.vlm.panel_compass(panels,ringNodes);
ids = false(size(filiment_pos,2),NPanels);
centroid = laca.vlm.panel_centroid(panels,ringNodes);
[idx,~] = knnsearch(filiment_pos',centroid','k',size(filiment_pos,2));

NS = [true,false,true,false];
NS = repmat(NS,1,NPanels);
for i = 1:NPanels
    idx_p = false(1,NPanels*4);
    idx_p(idx(i,:)) = true;
    for k = 1:4
        % don't add force from trialing edge filiment
        if isTE(i) && k == 3
            continue;
        end
        % get the start and end of the filiment
        A = ringNodes(:,panels(k,i));
        if k == 4
            B = ringNodes(:,panels(1,i));
        else
            B = ringNodes(:,panels(k+1,i));
        end
        v_norm = norm(B-A);
        n = (B-A)./v_norm;

        sides = NS;
        if k == 2 || k == 4
            sides = ~sides;
        end
        % get the position of the closest N filiments
        
        idx_k = idx_p&sides;
        pos = filiment_pos(:,idx_k);
        Np = nnz(idx_k);
        n = repmat(n,1,Np);

        %get the tolerance
        p_i = (i-1)*4;
        if k == 1 || k == 3
           filiment_tol =  norm(filiment_pos(:,p_i+1)-filiment_pos(:,p_i+3))*tol;
        else
            filiment_tol =  norm(filiment_pos(:,p_i+2)-filiment_pos(:,p_i+4))*tol;
        end
        % get vector between current filiment and closest other filiments
        P_vec = n.*repmat(dot(n,pos-repmat(A,1,Np)),3,1);

        % find filiments that lie on the current filiment
        res = dot(n,P_vec)>=0 & dot(n,P_vec)<=v_norm & vecnorm(pos-(A+P_vec))<filiment_tol;

        % update idecies of filiments that lie on the perimeter
        ids(idx_k,i) = ids(idx_k,i) | res';
    end
    %on the line
end
end