function [A,z]=jacobiancsd(fun,x)
% JACOBIANCSD    Complex Step Jacobian
% J = jacobiancsd(f,x) returns the numerical (m x n) Jacobian matrix of a
% m-vector function, f(x), at the refdrence point, x (n-vector).
% [J,z] = jacobiancsd(f,x) also returns the function value, z=f(x).
% By Fintan Healy, fintan.healy@bristol.ac.uk, 01/05/2022
%
z=fun(x);                       % function value
n=numel(x);                     % size of independent
m=numel(z);                     % size of dependent
A=zeros(m,n);                   % allocate memory for the Jacobian matrix
h=n*eps;                        % differentiation step size
xs = eye(n)*h*1i;
for k=1:n                       % loop for each independent variable
    A(:,k)=imag(fun(x+xs(:,k)));     % complex step differentiation
end
A = A./h;
end