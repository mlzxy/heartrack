function [ hr ] = trendDecision(hr,estm,idx,AccStimulus)
% toIdx is very powerful, use it well.
global Fs window;
excited_len = 4;
if idx < excited_len 
    return;
end
cIdx = toIdx(hr);
pIdx = toIdx(estm(idx-1));
ppIdx = toIdx(estm(idx-2));
if idx - AccStimulus < excited_len
    if cIdx <= pIdx % && pIdx == ppIdx
        hr = hr + Fs/window;
    end
end
end

