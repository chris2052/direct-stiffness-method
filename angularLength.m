function [L] = angularLength(numEl, conn, xx, zz)
%ANGULARLENGTH Summary of this function goes here
%   Detailed explanation goes here
L = zeros(numEl, 3);

for element = 1:numEl
    n = conn(element,:);
    
    xa = xx(n(2)) - xx(n(1));
    za = zz(n(2)) - zz(n(1));
    length = sqrt(xa*xa + za*za);
    cosa = xa/length;
    sina = za/length;
    
    L(element, 1) = length;
    L(element, 2) = cosa;
    L(element, 3) = sina;
end
end

