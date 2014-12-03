function [ idx ] = toIdx( freq )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Fs = 125;
window = 1000;
idx = freq/Fs*window+1;
idx = round(idx);
end

