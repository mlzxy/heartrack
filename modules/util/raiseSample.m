function [ si ] = raiseSample( s,d,fs )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
total = length(s)/fs;
t = 0:1/fs:total-1/fs;
fs = 125*d;
ti = 0:1/fs:total-1/fs;
si=interp1(t,s,ti, 'spline');
plot(t,s,'o',ti,si);

%si = upsample(s,d);
end

