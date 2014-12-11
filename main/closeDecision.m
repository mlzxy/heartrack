function [ freqC,peakC,DistC ] = closeDecision( peaks,prev_hr)  
% choose the peaks that be close to prev_hr

rpeak = cell(size(peaks));
tsort = @(x)sort(abs(x - prev_hr));

for i = 1:size(rpeak,1)
[V,I] = tsort(peaks{i,1}.peaki);
tmp.dist = V;
tmp.peaki = peaks{i,1}.peaki(I);
tmp.peakm = peaks{i,1}.peakm;
rpeak{i} = tmp;
end
   
dist = [];
peaki = [];
peakm = [];
for j = 1:length(rpeak)
dist = [dist, rpeak{j}.dist];
peaki = [peaki, rpeak{j}.peaki];
peakm = [peakm, rpeak{j}.peakm];
end


[DistC,I] = sort(dist);
freqC = peaki(I);
peakC = peakm(I);
end

