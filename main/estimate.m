function [ hr ] = estimate( peakx,estm,idx )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if idx == 1
        hr = estimate_first(peakx);
    else
        hr = estimate_mem(peakx,estm(idx-1));
    end
end

