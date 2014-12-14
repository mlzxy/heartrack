function [ D ] = euclidean( G,G2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
D  = sqrt(sum((G - G2) .^ 2));

end

