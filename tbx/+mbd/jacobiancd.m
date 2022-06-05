function A = jacobiancd(f, x, epsilon)
% Calculate Jacobian of function f at given x
% Central Finite Difference Method (CFDM)
%
% Inputs:
%   f can be a vector of function, but make sure it is a row vector
%   x is where the jacobian is being evaluated, it a row or column vector 
%   epsilon is a very small number
if nargin < 3
    epsilon = 1e-6; 
end
z=f(x);                       % function value
n=numel(x);                     % size of independent
m=numel(z);                     % size of dependent
A=zeros(m,n);                   % allocate memory for the Jacobian matrix
xs = eye(n)*epsilon;
for i = 1 : n
    A(:,i) = f(x+xs(:,i)) - f(x-xs(:,i));
end
A = A./(2*epsilon);
end