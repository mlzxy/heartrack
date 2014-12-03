function [ C ] = threshold_level( C,L,r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    for lev = 2:length(L)-2
        idx = 1;
        level = lev+1;
        for i=2:level
            idx=idx+L(i-1);
        end
        th = mean( abs(C(idx:idx-1+L(level))))*r;
        tC = C(idx:idx-1+L(level));
        tC(tC>th) = th;
        tC(tC<-th) = -th;
        C(idx:idx-1+L(level)) = tC;
    end
end

