function ap_ids = generate_ap_ids(obj,idx)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here
if ~exist('idx','var')
   idx = 1:length(obj.Wings); 
end
panels = cat(3,obj.Wings(idx).Panels);
N = size(panels,3);
isLE = cat(1,obj.Wings(idx).isLE);

Connectivity = cat(2,obj.Wings(idx).Connectivity);
np = [obj.Wings(idx).NPanels];
p_idx = cumsum([0,[obj.Wings(idx).NPanels]]);
for i = 1:length(np)
   Connectivity(:,p_idx(i)+1:p_idx(i+1)) = Connectivity(:,p_idx(i)+1:p_idx(i+1)) + ...
       repmat(p_idx(i),4,np(i));
end

nSpan = nnz(isLE);
nChord = N/nSpan;
if mod(N,nSpan)~=0
    error('odd number of panels')   
end
ap_ids = zeros(nSpan,nChord);

le_idx = find(isLE);
ys = reshape(panels(1,2,isLE),[],1);
[~,I] = sort(ys);
le_idx =le_idx(I);

for i = 1:nSpan
    tmp_idx = le_idx(i);
    for j = 1:nChord
        ap_ids(i,j) = tmp_idx;
        if j <nChord
            tmp_idx = Connectivity(3,tmp_idx);
        end
    end
end
end

