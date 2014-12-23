function [ hr,this_hrpeak ] = estimate_next( peak,estm,hrpeak, accClass, idx,bound, frame)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prev_hrpeak = hrpeak(idx-1);
prev_hr = estm(idx-1);
init_glb;
global Fs window;
persistent count stillcount AccStimulus;
if isempty(count)
    count = 1;
    stillcount = 1;
    AccStimulus = -10;
end

count = count +1;
ppg1 = 1;
ppg2 = 2;
if count == 1
    1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
peaktc = cell(2,3);
hb = prev_hr + bound;
lb = prev_hr - bound;

for i=1:size(peak,1)
    for j=1:size(peak,2)
        peaki = peak{i,j}.peaki;
        peakm = peak{i,j}.peakm;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        peakm = peakm(peaki >= lb & peaki <= hb);
        peaki = peaki(peaki >= lb & peaki <= hb);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        peaktc{i,j}.peaki = peaki;
        peaktc{i,j}.peakm = peakm;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% peaktc is the truncation of peak
freqM = magDecision(peaktc);
[freqC,~] = closeDecision(peak,prev_hr);
%[freqW1, freqW2]= wpDecision_dual(peaktc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
magD = freqM;
if ~isempty(freqM)
    freqM = freqM(ppg1);
end


this_hrpeak = 1;


if prev_hr ~= freqM
    hr = freqM(1)*0.8 + prev_hr*0.2;
else
    hr = prev_hr;
    stillcount = stillcount + 1;
    if stillcount >= 3
        if freqC(1) ~= prev_hr
            hr = prev_hr*0.5 + freqC(1)*0.5;
        elseif length(magD) == 2
            hr = prev_hr*0.5 + magD(ppg2)*0.5;
        end
        stillcount = 0;
    end
end


[hr, accRise] = accDecision(hr,estm,accClass,idx);
if accRise 
    AccStimulus = idx;
end

%%%%%%%%%%%%%%%%%
hr = trendDecision(hr,estm,idx,AccStimulus);

end

