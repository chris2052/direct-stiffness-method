function [t_t] = t_trans(alpha)
%TRANSP_TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
t_t = [ 
    cos(alpha), -sin(alpha), 0, 0, 0, 0; 
    sin(alpha), cos(alpha), 0, 0, 0, 0; 
    0, 0, 1, 0, 0, 0; 
    0, 0, 0, cos(alpha), -sin(alpha), 0; 
    0, 0, 0, sin(alpha), cos(alpha), 0; 
    0, 0, 0, 0, 0, 1; 
    ];
end