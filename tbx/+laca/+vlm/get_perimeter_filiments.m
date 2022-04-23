function [filiment_pos,ids] = get_perimeter_filiments(panels,ringNodes,N_neighbours,collocation,filiment_tol)
NPanels = size(panels,2);
filiment_pos = laca.vlm.panel_compass(panels,ringNodes);
% Mdl = KDTreeSearcher(filiment_pos');
ids = false(size(filiment_pos,2),NPanels);
N = min(N_neighbours,size(filiment_pos,2));
[idx,~] = knnsearch(filiment_pos',collocation','k',N);
for i = 1:NPanels
    isF = false(1,N);
    for k = 1:4
        A = ringNodes(:,panels(k,i));
        if k == 4
            B = ringNodes(:,panels(1,i));
        else
            B = ringNodes(:,panels(k+1,i));
        end
        v_norm = norm(B-A);
        n = (B-A)./v_norm;
        n = repmat(n,1,N);
        pos = filiment_pos(:,idx(i,:));
        P_vec = n.*repmat(dot(n,pos-repmat(A,1,N)),3,1);
        res = dot(n,P_vec)>=0 & dot(n,P_vec)<=v_norm & vecnorm(pos-(A+P_vec))<filiment_tol;
        isF = isF | res;
    end
    ids(idx(i,isF),i) = true;
    %on the line
end
end