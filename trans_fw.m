function [t] = trans_fw(alpha)
%TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
t = [ 
    cos(alpha), sin(alpha), 0, 0; 
    -sin(alpha), cos(alpha), 0, 0; 
    0, 0, cos(alpha), sin(alpha); 
    0, 0, -sin(alpha), cos(alpha); 
    ];
end