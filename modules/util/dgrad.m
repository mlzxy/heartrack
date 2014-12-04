function [ y ] = dgrad( x )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    y = zeros(1,length(x));
    for i = 2:length(x)
        y(i) = x(i)-x(i-1);
    end
end

