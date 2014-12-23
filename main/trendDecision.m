function [ hr ] = trendDecision(hr,estm,idx,AccStimulus)
% toIdx is very powerful, use it well.
global Fs window;
excited_len = 4;
prev_hr = estm(idx-1);
post_excited_len = 12;
if idx < excited_len 
    return;
end
cIdx = toIdx(hr);
pIdx = toIdx(estm(idx-1));
ppIdx = toIdx(estm(idx-2));
time_span = idx - AccStimulus;

if time_span < excited_len
    if cIdx <= pIdx % && pIdx == ppIdx
        hr = hr + Fs/window;
    end
end

if time_span < post_excited_len && time_span > excited_len
   if toIdx(hr)+1 == toIdx(prev_hr) 
       hr = hr + Fs/window*1.5;
   end
end
end

