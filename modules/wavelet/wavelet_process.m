function [ ppg_m ] = wavelet_process( ppg,r)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
level = 7;
method = 'db1';
[C,L] = wavedec(ppg,level,method);
C = mul_level(C,L,0,0);
C = mul_level(C,L,1,0);
C = threshold_level( C,L,r);
ppg_m = waverec(C,L,method);
end

