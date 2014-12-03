function [ num ] = frameNum(sig,window,step)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    len = size(sig,2);
    num = 0;
    x = -1;
    while(x < len)
        x = step*num+window;
        num = num + 1;
    end
    num = num-1;    
end

