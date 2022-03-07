r=rand(4,3,20);
c=rand(3,20);
n=rand(3,20);
t=rand(4,3,3);
ti=[1,12;2,18;3,3];
tic;
for i = 1:100
    aic = laca.panel.generate_AIC_mex('generate_AIC',r,c,n,t,ti);
end
toc;

tic;
for i = 1:100
    aic = laca.panel.generate_AIC(r,c,n,t,ti);
end
toc;