function [t_t] = t_trans_fw(alpha)
%TRANSP_TRANSFORMATION_FW Summary of this function goes here
%   Detailed explanation goes here
t_t = [ 
    cos(alpha), -sin(alpha), 0, 0; 
    sin(alpha), cos(alpha), 0, 0,; 
    0, 0, cos(alpha), -sin(alpha); 
    0, 0, sin(alpha), cos(alpha) 
    ];
end