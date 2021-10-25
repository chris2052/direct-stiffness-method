function [s_lok, vk1] = backCalculation(conn, xx, zz, numEl, loadElLok, ...
    EA, EI, D_glob, inz, typeEl)
%BACKCALCULATION Summary of this function goes here
%   Detailed explanation goes here

for element = 1:numEl

    n = conn(element,:);
    
    xa = xx(n(2)) - xx(n(1));
    za = zz(n(2)) - zz(n(1));
    l = sqrt(xa*xa + za*za);
    cosa = xa/l;
    sina = za/l;
        
    ge = typeEl(element);
    
    T = [ 
    cosa, sina, 0, 0, 0, 0; 
    -sina, cosa, 0, 0, 0, 0; 
    0, 0, 1, 0, 0, 0; 
    0, 0, 0, cosa, sina, 0; 
    0, 0, 0, -sina, cosa, 0; 
    0, 0, 0, 0, 0, 1; 
    ];

    DofEl = find(inz(element,:)');
    d_glob = D_glob(DofEl);
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
            
            T = [ 
                cosa, sina, 0, 0; 
                -sina, cosa, 0, 0; 
                0, 0, cosa, sina; 
                0, 0, -sina, cosa; 
                ];

    end
    fprintf('Element %d\n', element)
    s_lok = loadElLok(element,:)' + (k_lok/EI) * d_lok;
    vk1 = s_lok .* [-1, -1, -1, 1, 1, 1]'
    
end

end