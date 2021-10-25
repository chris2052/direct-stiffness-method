function loadvec = load_f(a, b, f, l, sina, cosa, ge)
%LOAD Summary of this function goes here
%   Detailed explanation goes here
Ni = 0;
Nk = 0;

T = [ 
    cosa, sina, 0, 0, 0, 0; 
    -sina, cosa, 0, 0, 0, 0; 
    0, 0, 1, 0, 0, 0; 
    0, 0, 0, cosa, sina, 0; 
    0, 0, 0, -sina, cosa, 0; 
    0, 0, 0, 0, 0, 1; 
    ];

switch ge
    case "ge1"
        Mi = f * (a * b^2)/(l^2);
        Mk = -f * (a^2 * b)/(l^2);
        Vi = -f * (b^2)/(l^3) * (l + 2*a);
        Vk = -f * (a^2)/(l^3) * (l + 2*b);
        
    case "ge2a"
        Mi = f*b/2 * (1 - (b*b)/(l*l));
        Mk = 0;
        Vi = -f*b/(2*l) * (3 - (b*b)/(l*l));
        Vk = -f/2 * (2 - 3*b/l + (b*b*b)/(l*l*l));
        
    case "ge2b"        
        Mi = 0;
        Mk = -f*a/2 * (1 - (a*a)/(l*l));
        Vi = -f/2 * (2 - 3*a/l + (a*a*a)/(l*l*l));
        Vk = -f*a/(2*l) * (3 - (a*a)/(l*l));
end
                
loadvec = T * [Ni, Vi, Mi, Nk, Vk, Mk]';

end

