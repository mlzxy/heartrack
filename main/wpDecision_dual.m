function [ wp,wpr ] = wpDecision_dual( peak )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    len = size(peak,2);
    peak_reverse = peak(:,len:-1:1);
    wp = wpDecision(peak);
    wpr = wpDecision(peak_reverse);
end

