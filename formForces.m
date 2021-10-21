function [F] = formForces(gDof, numEl, loadEl, loadNodes, inz)
%FORMFORCES Summary of this function goes here
%   Detailed explanation goes here
F = zeros(gDof, 1);

for element = 1:numEl
    DofEl = find(inz(element,:)');
    fGlob = loadEl(element,:)';
    F(DofEl,1) = F(DofEl,1) + fGlob;
end

F = F + loadNodes;

end