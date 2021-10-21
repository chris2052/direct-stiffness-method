function [K] = formStiffness(gDof, numEl, conn, inz, typeEl,...
    xx, zz, EI, EA)
%FORMSTIFFNESS Summary of this function goes here
%   Detailed explanation goes here

K = zeros(gDof);

for element = 1:numEl
    n = conn(element,:);
    
    xa = xx(n(2)) - xx(n(1));
    za = zz(n(2)) - zz(n(1));
    l = sqrt(xa*xa + za*za);
    cosa = xa/l;
    sina = za/l;
    
    DofEl = find(inz(element,:)');
    
    ge = typeEl(element);
    
    T = [ 
    cosa, sina, 0, 0, 0, 0; 
    -sina, cosa, 0, 0, 0, 0; 
    0, 0, 1, 0, 0, 0; 
    0, 0, 0, cosa, sina, 0; 
    0, 0, 0, -sina, cosa, 0; 
    0, 0, 0, 0, 0, 1; 
    ];
    
    switch ge
        case "ge1" % `Grundelement 1`
            k = [ 
                EA/l, 0, 0, -EA/l, 0, 0; 
                0, 12*EI/(l^3), -6*EI/(l^2), 0, -12*EI/(l^3), -6*EI/(l^2); 
                0, -6*EI/(l^2), 4*EI/l, 0, 6*EI/(l^2), 2*EI/l; 
                -EA/l, 0, 0, EA/l, 0, 0; 
                0, -12*EI/(l^3), 6*EI/(l^2), 0, 12*EI/(l^3), 6*EI/(l^2); 
                0, -6*EI/(l^2), 2*EI/l, 0, 6*EI/(l^2), 4*EI/l; 
                ];

        case "ge2a" % `Grundelement 2a`
            k = [ 
                EA/l, 0, 0, -EA/l, 0, 0; 
                0, 3*EI/(l^3), -3*EI/(l^2), 0, -3*EI/(l^3), 0; 
                0, -3*EI/(l^2), 3*EI/l, 0, 3*EI/(l^2), 0; 
                -EA/l, 0, 0, EA/l, 0, 0; 
                0, -3*EI/(l^3), 3*EI/(l^2), 0, 3*EI/(l^3), 0; 
                0, 0, 0, 0, 0, 0; 
                ];

        case "ge2b" % `Grundelement 2b`
            k = [ 
                EA/l, 0, 0, -EA/l, 0, 0; 
                0, 3*EI/(l^3), 0, 0, -3*EI/(l^3), -3*EI/(l^2); 
                0, 0, 0, 0, 0, 0; 
                -EA/l, 0, 0, EA/l, 0, 0; 
                0, -3*EI/(l^3), 0, 0, 3*EI/(l^3), 3*EI/(l^2); 
                0, -3*EI/(l^2), 0, 0, 3*EI/(l^2), 3*EI/l; 
                ];

        case "fw" % `Fachwerkstab`
            k = [ 
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
    
    K(DofEl, DofEl) = K(DofEl, DofEl) + T * k * T';
end

end

