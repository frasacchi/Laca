function out = ApplySplineSet(obj,coords,GIDs)
%APPLYSPLINESET Summary of this function goes here
%   Detailed explanation goes here
    coords = coords - obj.Midpoint(:,1);
    coords = obj.RefDir' * coords;
    [coords,idx] = sort(coords);
    GIDs = GIDs(idx);
    
    % get points within bound
    Ref_vec = obj.Midpoint(:,2)-obj.Midpoint(:,1);
    lower_bound = 0;
    upper_bound = norm(Ref_vec);
    
    idx = coords >= lower_bound & coords <= upper_bound;
    while nnz(idx)<5
        lower_bound = lower_bound - 0.025;
        upper_bound = upper_bound + 0.025;
        idx = coords >= lower_bound & coords <= upper_bound;
    end

    out = obj.copy();
    out.SplineSet = GIDs(idx);
end
