function obj = apply_result_filiment(obj,gamma,Fs,F_fil,V,rho)
idx = 1;
for i = 1:length(obj.Sections)
    pN = obj.Sections{i}.NPanels;
    p_idx = ((idx-1)*4+1):((idx-1+pN)*4);
    obj.Sections{i}.apply_result_filiment(...
        gamma(idx:idx+pN-1),Fs(:,idx:idx+pN-1),...
        F_fil(:,p_idx),V,rho);
    idx = idx + pN;
end
end
