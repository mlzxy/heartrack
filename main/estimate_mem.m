function [ hr ] = estimate_mem( peak,prev_hr,bound )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%%%%%
%%%only use the peaks when r == max
persistent count;
if isempty(count)
    count = 1;
end
count = count +1;
% peakx = cell(2,1);
% peakx{1,1} = peak{1,end};
% peakx{2,1} = peak{2,end};
peakx = cell(2,3);

hb = prev_hr + bound;
lb = prev_hr - bound;

fset = [];
for i=1:size(peak,1)
    for j=1:size(peak,2)
        peaki = peak{i,j}.peaki;
        peakm = peak{i,j}.peakm;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        peakm = peakm(peaki >= lb & peaki <= hb);
        peaki = peaki(peaki >= lb & peaki <= hb);
        fset = [fset,peaki];
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        peakx{i,j}.peaki = peaki;
        peakx{i,j}.peakm = peakm;
    end
end

freqD = magDecision(peakx);



if isempty(freqD) 
    hr = prev_hr;
    return;
end

%%%mixin
if ismember(prev_hr,freqD)
    hr = freqD(1)*0.8 + prev_hr*0.2;
else
    hr = freqD(1);
end

end

