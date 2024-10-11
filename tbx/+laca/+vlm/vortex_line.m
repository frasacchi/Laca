function [q] = vortex_line(p1,p2,p_i,gamma,eta)
%VORTEX_LINE calculates the induced velocity at point p from a vortex line
%between p1 and p2 with strenth gamma (right hand rule from p1 -> p2)
if nargin < 5
    eta = 1e-6;
end

% get cross product of r1 and r2
r1cr2 = [(p_i(2)-p1(2))*(p_i(3)-p2(3))-(p_i(3)-p1(3))*(p_i(2)-p2(2));...
    -(p_i(1)-p1(1))*(p_i(3)-p2(3))+(p_i(3)-p1(3))*(p_i(1)-p2(1));...
    (p_i(1)-p1(1))*(p_i(2)-p2(2))-(p_i(2)-p1(2))*(p_i(1)-p2(1))];

% get square of norm of cross product
r1cr2_sq = r1cr2(1)^2 + r1cr2(2)^2 + r1cr2(3)^2;

% get r1 and r2 distances
r1 = sqrt((p1(1)-p_i(1)).^2 + (p1(2)-p_i(2)).^2 + (p1(3)-p_i(3)).^2);
r2 = sqrt((p2(1)-p_i(1)).^2 + (p2(2)-p_i(2)).^2 + (p2(3)-p_i(3)).^2);

% check not too close to vortex
if r1<eta || r2<eta || r1cr2_sq < eta^2
    q = zeros(3,1);
else
    % get dot product r_0.r_1 and r_0.r_2
    dr1 = (p2(1)-p1(1))*(p_i(1)-p1(1))+(p2(2)-p1(2))*(p_i(2)-p1(2))+(p2(3)-p1(3))*(p_i(3)-p1(3));
    dr2 = (p2(1)-p1(1))*(p_i(1)-p2(1))+(p2(2)-p1(2))*(p_i(2)-p2(2))+(p2(3)-p1(3))*(p_i(3)-p2(3));
    
    %get induced Velocity
    K = gamma/(4*pi*r1cr2_sq)*(dr1/r1-dr2/r2);
    q = r1cr2.*K;
end

end

