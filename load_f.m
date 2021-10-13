function loadvec = load_f(a, b, f, l)
%LOAD Summary of this function goes here
%   Detailed explanation goes here
Ni = 0;
Nk = 0;
Mi = f * (a * b^2)/(l^2);
Mk = -f * (a^2 * b)/(l^2);
Vi = -f * (b^2)/(l^3) * (l + 2*a);
Vk = -f * (a^2)/(l^3) * (l + 2*b);

loadvec = [Ni, Vi, Mi, Nk, Vk, Mk];
end

