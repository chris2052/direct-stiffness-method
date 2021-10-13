function loadvec = load_q(pi, pk, l)
%LOAD Summary of this function goes here
%   Detailed explanation goes here
Ni = 0;
Nk = 0;
Mi = l^2/60 * (3*pi + 2*pk);
Mk = -l^2/60 * (2*pi + 3*pk);
Vi = -l/60 * (21*pi + 9*pk);
Vk = -l/60 * (9*pi + 21*pk);

loadvec = [Ni, Vi, Mi, Nk, Vk, Mk];
end

