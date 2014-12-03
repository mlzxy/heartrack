function [ peak,peaklist,maglist ] = pvPeaks( prevF,currF, winLen,step, Fsample)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% utility
timeInterval = @(t1,t2) (max(t1,t2)-min(t1,t2))*step*1/Fsample;
toFreq = @(x) (x-1)/(winLen/2)*(winLen-1)*Fsample/winLen/2; 


% variable checks
peak = {};
fmLen = length(prevF);
if fmLen == 0 
    fmLen = length(currF);
end
if int32(fmLen/winLen) - fmLen/winLen ~= 0 || fmLen ~= length(currF) || mod(winLen,step) ~= 0
    error('illegal input in the pvPeaks');
end

% get windows in winlist
if isempty(prevF)
    %Do nothing
else
    currF = [prevF(end-winLen+step+1:end),currF];
end
%
curLen = length(currF);
hwin = hamming(winLen)';
winNum = (curLen-winLen)/step+1;
% 
winList = zeros(winNum,winLen);
fmagList = zeros(winNum,winLen);
fphList = zeros(winNum,winLen);
peakCell = cell(1,winNum);
cursor = 1;
idx = 1;
while cursor+winLen-1 <= curLen
    tmpSig = hwin.*currF(cursor:cursor+winLen-1);
    tmpFSig = fft(tmpSig);
    cursor = cursor+step;
    %    
    winList(idx,:) = tmpSig;
    fmagList(idx,:) = abs(tmpFSig);
    fphList(idx,:) = angle(tmpFSig);
    %
    [peakidx,~] = peakfinder(abs(tmpFSig),0,mean(abs(tmpFSig)));  % need further tweak in here
    %peakidx = peakidx(1:end/2);
    peakCell{idx} = peakidx(toFreq(peakidx)> 0.5 & toFreq(peakidx)<3);
    idx = idx + 1; 
end



function [fn] = proximate(f,theta1,theta2,timediff)
    n = 1:100;
    fn = (theta2-theta1 + 2*pi*n)/ (2*pi*timediff);
    adfn = abs(fn-f);
    [~,id] = min(adfn); 
    fn = fn(id);
end

function [fL] = proxm(pf,pha,phb,timediff)
    len = length(pf);
    fL = zeros(1,len);
    for t = 1:len
        fL(t) = proximate(pf(t),pha(t),phb(t),timediff);
    end
end



% calculate better frequency
peaklist = [];
maglist = [];
for i = 1:winNum
    for j = i+1:winNum       
          fCa = peakCell{i};
          fCb = peakCell{j};
          pf = intersect(fCa,fCb);
          %%%%
          pha = fphList(i,pf);
          phb = fphList(j,pf);          
          mga = fmagList(i,pf);
          mgb = fmagList(j,pf);
          mg = (mga+mgb)/2;
          st.mag = mg;
          st.feq = toFreq(proxm(pf,pha,phb,timeInterval(i,j)));
          peaklist = [peaklist,st.feq];
          maglist = [maglist,st.mag];
          peak{end+1} = st;
          
    end
end



end