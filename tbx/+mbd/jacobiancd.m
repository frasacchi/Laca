function [J,f0] = jacobiancd(fun, x, h)
% JACOBIANCD Compute the Jacobian matrix using central differencing.
%
%   J = jacobiancd(fun, x, h) computes the Jacobian of the vector–valued function
%   fun at the point x using central differences. If x is an n–vector and
%   fun(x) returns an m–vector, then J is an m-by-n matrix where
%
%       J(i,j) ≈ ( f_i(x + h*e_j) - f_i(x - h*e_j) ) / (2*h).
%
%   h is an optional step size (default: 1e-5).
%
%   Example:
%       fun = @(x) [ x(1)^2 + x(2); sin(x(1)) + cos(x(2)) ];
%       x = [1; 2];
%       J = jacobiancd(fun, x);
%

    if nargin < 3
        h = 1e-5;
    end
    n = length(x);
    f0 = fun(x);
    m = length(f0);
    J = zeros(m, n);
    for j = 1:n
        e = zeros(n,1); e(j) = h;
        J(:, j) = (fun(x + e) - fun(x - e));
    end
    J = J./(2*h);
end