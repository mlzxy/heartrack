function [ hr ] = estimate_next( peak,prev_hr,bound )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%%%%%
%%%only use the peaks when r == max
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent count stillcount;
if isempty(count)
    count = 1;
    stillcount = 0;
end
count = count +1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



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

% freqcell = cell(1,3);
% for i=1:3
%    freqcell{i} = magDecision(peakx(:,i));
% end
freqM = magDecision(peakx);
freqC = [];
magC = [];
for i = 1:3
    feqpekC = closeDecision(peakx(:,i),prev_hr);
end
freqW = wpDecision(peak);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

