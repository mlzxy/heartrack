function [ threshold ] = expRaiseThreshold( estm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
threshold = 10000;
global Fs window;

raiseMark = 0.5;
[Vmin,~] = min(estm);
[Vmax,Imax] = max(estm);
if Vmax - Vmin < raiseMark
    return;
end   
begin = Imax-1;
diff = estm(Imax) - estm(begin);
while diff >= 0 && begin > 1
    begin = begin - 1;
    diff = estm(Imax) - estm(begin);
end
threshold  = estm(begin+1) + Fs/window;
end

