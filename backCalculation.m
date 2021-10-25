function [s_lok, vk1] = backCalculation(numEl, loadElLok, sina, cosa, l,...
    EA, EI, D_glob, inz, ge)
%BACKCALCULATION Summary of this function goes here
%   Detailed explanation goes here

T = [ 
    cosa, sina, 0, 0, 0, 0; 
    -sina, cosa, 0, 0, 0, 0; 
    0, 0, 1, 0, 0, 0; 
    0, 0, 0, cosa, sina, 0; 
    0, 0, 0, -sina, cosa, 0; 
    0, 0, 0, 0, 0, 1; 
    ];

elem = find(inz(numEl,:));
d_glob = D_glob(elem);
d_lok = T' * d_glob;

switch ge
    case "ge1" % `Grundelement 1`
        k_lok = [ 
            EA/l, 0, 0, -EA/l, 0, 0; 
            0, 12*EI/(l^3), -6*EI/(l^2), 0, -12*EI/(l^3), -6*EI/(l^2); 
            0, -6*EI/(l^2), 4*EI/l, 0, 6*EI/(l^2), 2*EI/l; 
            -EA/l, 0, 0, EA/l, 0, 0; 
            0, -12*EI/(l^3), 6*EI/(l^2), 0, 12*EI/(l^3), 6*EI/(l^2); 
            0, -6*EI/(l^2), 2*EI/l, 0, 6*EI/(l^2), 4*EI/l; 
            ];
    
    case "ge2a" % `Grundelement 2a`
        k_lok = [ 
            EA/l, 0, 0, -EA/l, 0, 0; 
            0, 3*EI/(l^3), -3*EI/(l^2), 0, -3*EI/(l^3), 0; 
            0, -3*EI/(l^2), 3*EI/l, 0, 3*EI/(l^2), 0; 
            -EA/l, 0, 0, EA/l, 0, 0; 
            0, -3*EI/(l^3), 3*EI/(l^2), 0, 3*EI/(l^3), 0; 
            0, 0, 0, 0, 0, 0; 
            ];
    
    case "ge2b" % `Grundelement 2b`
        k_lok = [ 
            EA/l, 0, 0, -EA/l, 0, 0; 
            0, 3*EI/(l^3), 0, 0, -3*EI/(l^3), -3*EI/(l^2); 
            0, 0, 0, 0, 0, 0; 
            -EA/l, 0, 0, EA/l, 0, 0; 
            0, -3*EI/(l^3), 0, 0, 3*EI/(l^3), 3*EI/(l^2); 
            0, -3*EI/(l^2), 0, 0, 3*EI/(l^2), 3*EI/l; 
            ];
    
    case "fw" % `Fachwerkstab`
        k_lok = [ 
            EA/l, 0, -EA/l, 0; 
            0, 0, 0, 0;
            -EA/l, 0, EA/l, 0; 
            0, 0, 0, 0;
            ];
end

s_lok = loadElLok + (k_lok/EI) * d_lok;
vk1 = s_lok .* [-1, -1, -1, 1, 1, 1];

end

