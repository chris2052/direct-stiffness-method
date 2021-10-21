function loadvec = load_q(pi, pk, l, ge)
%LOAD Summary of this function goes here
%   Detailed explanation goes here
Ni = 0;
Nk = 0;

switch ge
    case "ge1"
        Mi = l^2/60 * (3*pi + 2*pk);
        Mk = -l^2/60 * (2*pi + 3*pk);
        Vi = -l/60 * (21*pi + 9*pk);
        Vk = -l/60 * (9*pi + 21*pk);
        
    case "ge2a"
        Mi = l*l/120 * (8*pi + 7*pk);
        Mk = 0;
        Vi = -l/120 * (48*pi + 27*pk);
        Vk = -l/120 * (12*pi + 33*pk);
        
    case "ge2b"
        Mi = 0;
        Mk = l*l/120 * (7*pi + 8*pk);
        Vi = -l/120 * (33*pi + 12*pk);
        Vk = -l/120 * (27*pi + 48*pk);
        
end

loadvec = [Ni, Vi, Mi, Nk, Vk, Mk];

end

