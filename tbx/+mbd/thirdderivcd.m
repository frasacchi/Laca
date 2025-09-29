function T = thirdderivcd(fun, x, h)
% THIRDDERIVCD Compute the third derivative tensor using nested central differencing.
%
%   T = thirdderivcd(fun, x, h) computes the third derivative tensor of the vector–valued
%   function fun at the point x by differentiating the Hessian via central differences.
%   If x is an n–vector and fun(x) is an m–vector, then T is an m-by-n-by-n-by-n array with
%
%       T(i,j,k,l) ≈ d^3 f_i / (dx_j dx_k dx_l).
%
%   The input h is an optional base step size for the Jacobian (default: 1e-5).
%   For the Hessian, an effective step d = sqrt(h) is used, and for the third derivative,
%   the effective step is taken as d3 = h^(1/3).
%
%   Example:
%       fun = @(x) [ x(1)^3 + x(2); sin(x(1)) + cos(x(2)) ];
%       x = [1; 2];
%       T = thirdderivcd(fun, x);
%

    if nargin < 3
        h = 1e-5;
    end
    d3 = h^(1/3);  % effective step for differentiating the Hessian
    n = length(x);
    f0 = fun(x);
    m = length(f0);
    T = zeros(m, n, n, n);
    
    % Differentiate the Hessian with respect to each x_l.
    for l = 1:n
        e = zeros(n,1); e(l) = 1;
        A_plus  = hessiancd(fun, x + d3*e, h);
        A_minus = hessiancd(fun, x - d3*e, h);
        T(:,:,:,l) = (A_plus - A_minus) / (2*d3);
    end
    
    % If fun is scalar (m == 1), symmetrize the third derivative tensor over its derivative indices.
    if m == 1
        for j = 1:n
            for k = 1:n
                for l = 1:n
                    perms_avg = ( T(1,j,k,l) + T(1,j,l,k) + T(1,k,j,l) + ...
                                  T(1,k,l,j) + T(1,l,j,k) + T(1,l,k,j) ) / 6;
                    T(1,j,k,l) = perms_avg;
                end
            end
        end
    end
end
