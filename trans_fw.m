function [t] = trans_fw(cosa, sina)
%TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
t = [ 
    cosa, sina, 0, 0; 
    -sina, cosa, 0, 0; 
    0, 0, cosa, sina; 
    0, 0, -sina, cosa; 
    ];
end