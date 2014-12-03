function [ fm ] = getFrameica( sig,num )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    frame = getFrame(sig,num);
    fm = [frame(2,:);frame(3,:);frame(4,:);frame(6,:)];
end

