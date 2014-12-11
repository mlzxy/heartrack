function [ freqC,DistC ] = closeDecision( peaks,prev_hr)  
% choose the peaks that be close to prev_hr
    freqC = [];
    peakC = [];
    DistC = [];
    for i = 1:size(peaks,2)
        [f,p,d] = closeDecision_sub(peaks(:,i),prev_hr);
        freqC = [freqC,f];
        peakC = [peakC,p];
        DistC = [DistC,d];
    end
    [DistC,I] = sort(DistC);
    peakC = peakC(I);
    freqC = freqC(I);
    
    [freqC,I] = unique(freqC);
    DistC = DistC(I);
    [DistC,I] = sort(DistC);
    freqC = freqC(I);
end
