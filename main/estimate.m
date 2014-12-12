function [ hr,hrpeak ] = estimate( peakx,estm,hrpeak,idx,b )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if idx == 1
        hr = estimate_first(peakx);
        hrpeak = hr;
    else
        [hr,hrpeak] = estimate_next(peakx,estm(idx-1),hrpeak(idx-1),b);
    end
end

