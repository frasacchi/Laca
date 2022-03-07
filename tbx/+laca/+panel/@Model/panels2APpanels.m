function [ap_panels] = panels2APpanels(obj,idx)
%PANELS2APPANELS Summary of this function goes here
%   Detailed explanation goes here
    if ~exist('idx','var')
       idx = 1:length(obj.Wings); 
    end
    ap_ids = obj.generate_ap_ids(idx);
    ap_panels = zeros(4,3,size(ap_ids,1),size(ap_ids,2));
    panels = obj.Panels;
    for i = 1:size(ap_ids,1)
        for j = 1:size(ap_ids,2)
            ap_panels(:,:,i,j) = panels(:,:,ap_ids(i,j));
        end
    end
end

