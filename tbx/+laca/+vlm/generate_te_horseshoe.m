function [TENodes,TERings,TEidx] = generate_te_horseshoe(panels,nodes,isTE,dir)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here

N = nnz(isTE);
idx_te = find(isTE);

TENodes = zeros(3,N*4);
TERings = zeros(4,N);
TEidx = [(1:N)',idx_te];

for i = 1:length(idx_te)
    A = nodes(:,panels(1,idx_te(i)));
    B = nodes(:,panels(2,idx_te(i)));
    AD = nodes(:,panels(4,idx_te(i)))-A;
    BC = nodes(:,panels(3,idx_te(i)))-B;

    TENodes(:,(i-1)*4+(1:2)) = [A + 1.25*AD,B + 1.25*BC];
    TENodes(:,(i-1)*4+(3:4)) = [B + 1.25*BC,A + 1.25*AD] + repmat(dir(:),1,2);

    TERings(:,i) = (i-1)*4 + (1:4);  
end

end

