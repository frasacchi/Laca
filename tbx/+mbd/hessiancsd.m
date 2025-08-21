function A = hessiancsd(fun, x,h)
% HESSIANCSD  Compute the Hessian tensor using the complex–step derivative method.
%
%   A = HESSIANCSD(fun, x) computes the Hessian tensor of the vector–valued function
%   fun at the point x using complex–step approximations. The function fun should
%   accept a vector x and return a vector f. The resulting Hessian tensor A has size
%   m-by-n-by-n, where n = length(x) and m = length(fun(x)). For each component f_i,
%   A(i,j,k) approximates the second derivative
%
%       A(i,j,k) = d^2 f_i / (dx_j dx_k)
%
%   The method uses the formulas:
%
%       For j ~= k (off–diagonal entries):
%           f_{jk}(x) ≈ [ Im( fun(x + i*h*(e_j+e_k)) ) - Im( fun(x + i*h*(e_j-e_k)) ) ] / (4*h^2)
%
%       For j == k (diagonal entries):
%           f_{jj}(x) ≈ [ Re( fun(x + i*2*h*e_j) ) - fun(x) ] / (2*h^2)
%
%   Note: This method requires that fun is analytic and accepts complex inputs.
%
%   Example:
%       fun = @(x) [ x(1)^2 + x(2); sin(x(1)) + cos(x(2)) ];
%       x = [1; 2];
%       A = hessiancsd(fun, x);
%
%   See also: jacobian, complex step derivative.

    % h = 1e-20;    % Step size for complex perturbation; adjust as needed
    n = length(x);
    if nargin<3
        h=1e-6;
    end
    f0 = fun(x);  % Evaluate f at x (assumed real)
    m = length(f0);
    
    % Initialize the Hessian tensor: size m x n x n.
    A = zeros(m, n, n);
    
    % Loop over each variable index j.
    for j = 1:n
        ej = zeros(n,1); 
        ej(j) = 1;  % Unit vector in the j-th direction
        
        % Diagonal term: second derivative with respect to x_j twice.
        f_diag = fun(x + 2i*h*ej);
        % Use the real part difference for diagonal entries.
        A(:, j, j) = (real(f_diag) - f0) / (2*h^2);
        
        % Off-diagonal terms: j < k (by symmetry, A(:,:,k,j) = A(:,:,j,k))
        for k = j+1:n
            ek = zeros(n,1);
            ek(k) = 1;  % Unit vector in the k-th direction
            
            % Evaluate f at two complex–perturbed points.
            f_plus  = fun(x + 1i*h*(ej + ek));
            f_minus = fun(x + 1i*h*(ej - ek));
            % Approximate the mixed second derivative.
            A(:, j, k) = (imag(f_plus) - imag(f_minus)) / (4*h^2);
            % Enforce symmetry: f_{jk} = f_{kj}
            A(:, k, j) = A(:, j, k);
        end
    end
end