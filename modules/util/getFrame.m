function [ o ] = getFrame( sig,num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global window step
    o = sig(:,(num-1)*step+1:(num-1)*step+window);
    if size(o,1) == 6
        o = [o; (o(4,:)+o(5,:)+o(6,:))/3];
    else
        o = [o; (o(3,:)+o(4,:)+o(5,:))/3];
    end
end

