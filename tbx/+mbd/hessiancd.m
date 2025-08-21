function A = hessiancd(fun, x, h)
% HESSIANCD Compute the Hessian tensor using nested central differencing.
%
%   A = hessiancd(fun, x, h) computes the Hessian tensor of the vector–valued
%   function fun at the point x by differentiating the Jacobian via central differences.
%   If x is an n–vector and fun(x) is an m–vector, then A is an m-by-n-by-n array with
%
%       A(i,j,k) ≈ d^2 f_i / (dx_j dx_k).
%
%   The input h is an optional base step size for the Jacobian (default: 1e-5).
%   For the Hessian central difference, the effective step is taken as d = sqrt(h).
%
%   Example:
%       fun = @(x) [ x(1)^2 + x(2); sin(x(1)) + cos(x(2)) ];
%       x = [1; 2];
%       A = hessiancd(fun, x);
%

    if nargin < 3
        h = 1e-5;
    end
    d = sqrt(h);  % effective step for differentiating the Jacobian
    n = length(x);
    f0 = fun(x);
    m = length(f0);
    A = zeros(m, n, n);
    
    % Differentiate the Jacobian with respect to each x_k.
    for k = 1:n
        e = zeros(n,1); e(k) = 1;
        J_plus  = jacobiancd(fun, x + d*e, h);
        J_minus = jacobiancd(fun, x - d*e, h);
        A(:, :, k) = (J_plus - J_minus) / (2*d);
    end
    
    % Optionally symmetrize the Hessian for each output component.
    % for i = 1:m
    %     for j = 1:n
    %         for k = j+1:n
    %             avg = (A(i,j,k) + A(i,k,j)) / 2;
    %             A(i,j,k) = avg;
    %             A(i,k,j) = avg;
    %         end
    %     end
    % end
end