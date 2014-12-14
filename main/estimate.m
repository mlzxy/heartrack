function [ hr,hrpeak ] = estimate( peakx,estm,hrpeak,idx,b,accClass )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if idx == 1
        hr = estimate_first(peakx);
        hrpeak = hr;
    else
        [hr,hrpeak] = estimate_next(peakx,estm,hrpeak, accClass,idx,b);
    end
end

