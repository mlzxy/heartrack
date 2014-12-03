function [ C ] = mul_level( C,L,level,cvec)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    idx = 1;
    level = level+1;
    for i=2:level
        idx=idx+L(i-1);
    end
    
    C(idx:idx-1+L(level)) = cvec.*C(idx:idx-1+L(level));

end

