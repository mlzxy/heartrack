function [ arr ] = mArray( clct )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    array = clct.toArray();
    len = length(array);
    arr = zeros(1,len);
    for i = 1:len
        arr(i) = array(i);
    end
end

