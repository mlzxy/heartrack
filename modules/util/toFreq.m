function [ y ] = toFreq( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global window Fs  
    y = x*Fs/window;
end

