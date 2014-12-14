function [ output_args ] = mylpc( s,order )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [a,g] = lpc(s,order);
    output_args = [g,a(2:end)];

end

