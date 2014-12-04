function [ o ] = closest_to( x,vec,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    v = abs(abs(vec)-abs(x));
    [~,I] = sort(v);
    o = vec(I);
    if n < length(o)
        o = o(1:n);
    end
end

