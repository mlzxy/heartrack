function [ idx ] = toIdx( freq )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global Fs window
idx = freq/Fs*window+1;
idx = round(idx);
end

