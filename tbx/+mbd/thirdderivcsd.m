function T = thirdderivcsd(fun, x)
% THIRDDERIVCSD Compute the third derivative tensor using nested complex–step differentiation.
%
%   T = THIRDDERIVCSD(fun, x) computes the third derivative tensor of a vector–valued
%   function fun at the point x using complex–step approximations.
%
%   For a function f : R^n -> R^m, the output T is an m-by-n-by-n-by-n array such that
%   for each output component f_i, T(i,j,k,l) approximates:
%
%       T(i,j,k,l) = d^3 f_i / (dx_j dx_k dx_l).
%
%   The method works by computing the Hessian at a perturbed point using the complex–step:
%
%       A(x + i*h*e_l) = Hessian at x perturbed in the l-th direction,
%
%   and then approximating the derivative with respect to x_l via
%
%       T(:,:,:,l) = imag( A(x + i*h*e_l) ) / h.
%
%   Note: This approach requires that fun is analytic and that it accepts complex inputs.
%
%   Example:
%       fun = @(x) [ x(1)^3 + x(2);
%                    sin(x(1)) + cos(x(2)) ];
%       x = [1; 2];
%       T = thirdderivcsd(fun, x);
%
%   It is assumed that a function hessiancsd(fun, x) exists that computes the Hessian
%   tensor (second derivatives) using complex–step differentiation.
%
%   See also: hessiancsd.

    h = 1e-6;         % Step size for the additional complex perturbation.
    n = length(x);     % Dimension of the input.
    f0 = fun(x);       % Evaluate f at x.
    m = length(f0);    % Dimension of the output.
    
    % Initialize third derivative tensor: size m x n x n x n.
    T = zeros(m, n, n, n);
    
    % Loop over each direction l to differentiate the Hessian with respect to x_l.
    for l = 1:n
        e_l = zeros(n,1);
        e_l(l) = 1;  % Unit vector in the l-th direction.
        
        % Compute the Hessian at the perturbed point x + i*h*e_l.
        A_pert = hessiancsd(fun, x + 1i*h*e_l);
        
        % The derivative of the Hessian with respect to x_l is approximated by:
        % T(:,:,:,l) = imag( A(x + i*h*e_l) ) / h.
        T(:,:,:,l) = imag(A_pert) / h;
    end
end