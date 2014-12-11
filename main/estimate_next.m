function [ hr ] = estimate_next( peak,prev_hr,bound )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent count stillcount;
if isempty(count)
    count = 1;
    stillcount = 1;
end
count = count +1;
ppg1 = 1;
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

%%% peaktc is the truncation of peak
freqM = magDecision(peaktc);
[freqC,magC,distC] = closeDecision(peak,prev_hr);
[freqW1, freqW2]= wpDecision_dual(peak);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







if isempty(freqM) 
    hr = prev_hr;    
    stillcount = stillcount + 1;
    return;
end

%%%mixin
freqM = freqM(ppg1);

if prev_hr ~= freqM
    hr = freqM(1)*0.8 + prev_hr*0.2;
else
    hr = prev_hr;
end

end

