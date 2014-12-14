function [ class ] = whichclass( vec,C )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
   x = zeros(1,size(C,1));
   for i = 1:size(C,1)
   x(i) = euclidean(vec,C(i,:));
   end
   [~,class] = min(x);
end

