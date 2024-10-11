function M = get_moment(F,pos,p)
%GET_MOMENT Summary of this function goes here
%   Detailed explanation goes here
M = sum(cross(pos-repmat(p(:),1,size(F,2)),F),2);
end

