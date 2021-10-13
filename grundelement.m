function [k] = grundelement(ge, l, E, A, I)
%GRUNDELEMENT returns the local stiffness matrix 
%   set `ge` to: 'ge1', 'ge2a', 'ge2b' 
%   or 'fw' --> IMPORTANT: `I` must be set to `-1` (or any other value)
switch ge
    case 'ge1' % `Grundelement 1`
        k = [ 
            E*A/l, 0, 0, -E*A/l, 0, 0; 
            0, 12*E*I/(l^3), -6*E*I/(l^2), 0, -12*E*I/(l^3), -6*E*I/(l^2); 
            0, -6*E*I/(l^2), 4*E*I/l, 0, 6*E*I/(l^2), 2*E*I/l; 
            -E*A/l, 0, 0, E*A/l, 0, 0; 
            0, -12*E*I/(l^3), 6*E*I/(l^2), 0, 12*E*I/(l^3), 6*E*I/(l^2); 
            0, -6*E*I/(l^2), 2*E*I/l, 0, 6*E*I/(l^2), 4*E*I/l; 
            ];
        
    case 'ge2a' % `Grundelement 2a`
        k = [ 
            E*A/l, 0, 0, -E*A/l, 0, 0; 
            0, 3*E*I/(l^3), -3*E*I/(l^2), 0, -3*E*I/(l^3), 0; 
            0, -3*E*I/(l^2), 3*E*I/l, 0, 3*E*I/(l^2), 0; 
            -E*A/l, 0, 0, E*A/l, 0, 0; 
            0, -3*E*I/(l^3), 3*E*I/(l^2), 0, 3*E*I/(l^3), 0; 
            0, 0, 0, 0, 0, 0; 
            ];

    case 'ge2b' % `Grundelement 2b`
        k = [ 
            E*A/l, 0, 0, -E*A/l, 0, 0; 
            0, 3*E*I/(l^3), 0, 0, -3*E*I/(l^3), -3*E*I/(l^2); 
            0, 0, 0, 0, 0, 0; 
            -E*A/l, 0, 0, E*A/l, 0, 0; 
            0, -3*E*I/(l^3), 0, 0, 3*E*I/(l^3), 3*E*I/(l^2); 
            0, -3*E*I/(l^2), 0, 0, 3*E*I/(l^2), 3*E*I/l; 
            ];

    case 'fw' % `Fachwerkstab`
        k = [ 
            E*A/l, 0, -E*A/l, 0; 
            0, 0, 0, 0;
            -E*A/l, 0, E*A/l, 0; 
            0, 0, 0, 0;
            ];

end
end

