function [ hr ] = getHr (dn,fn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global Hr;
    x = Hr{dn};
    hr = x(fn)/60;
end

