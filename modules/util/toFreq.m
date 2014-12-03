function [ y ] = toFreq( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    Fs = 125;
    N = 1000;   
    y = x*Fs/N;
end

