function obj = apply_result_filiment(obj,gamma,Fs,V,rho)
idx = 1;
for i = 1:length(obj.Sections)
    pN = obj.Sections(i).NPanels;
    obj.Sections(i) = obj.Sections(i).apply_result(...
        gamma(idx:idx+pN-1),...
        Fs(:,idx:idx+pN-1),V,rho);
    idx = idx + pN;
end
end
