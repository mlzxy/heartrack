function [ o ] = getFrame( sig,num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    window = 1000;
    step = 125*2;
    o = sig(:,(num-1)*step+1:(num-1)*step+window);
    o = [o; (o(4,:)+o(5,:)+o(6,:))/3];
end

