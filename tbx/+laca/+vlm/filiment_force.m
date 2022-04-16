function F = filiment_force(panels,ringNodes,V,connectivity,gamma,isTE,rho)
N_panels = size(panels,2);

A = ringNodes(:,panels(1,:));
B = ringNodes(:,panels(2,:));
C = ringNodes(:,panels(3,:));
D = ringNodes(:,panels(4,:));

AB = B-A;
BC = C-B;
CD = D-C;
DA = A-D;

vec = reshape([AB;BC;CD;DA],3,[]);
V_new = reshape([V;V;V;V],3,[]);

f_gamma = zeros(1,N_panels*4);
gamma = [0;gamma];
connectivity(isnan(connectivity))=0;
for i = 1:N_panels
   idx = (i-1)*4;
   for j = 1:3
       f_gamma(idx+j) = gamma(i+1) - gamma(connectivity(j,i)+1);
   end
   if isTE(i)
      f_gamma(idx+4) = 0;
   else
       f_gamma(idx+4) = gamma(i+1) - gamma(connectivity(4,i)+1);
   end
end

F_fil = rho.*cross(vec,V_new).*repmat(f_gamma,3,1);

F = zeros(3,N_panels);
for i = 1:N_panels
    idx = (i-1)*4+1;
   F(:,i) = sum(F_fil(:,idx:idx+3),2);
end

end