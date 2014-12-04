function [ hr ] = estimate_first( peakx )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
global Fs window;
%%  based on magnitude
hmaplist = [java.util.Hashtable,java.util.Hashtable];
for i=1:size(peakx,1)
    hmap = hmaplist(i);
    for j=1:size(peakx,2)
        p = peakx{i,j};
        len = length(p.peaki);
        peaki = p.peaki;
        peakm = p.peakm;
        peakm = toRank(peakm);
        for k = 1:len
            x = hmap.get(peaki(k));
            x(end+1) = peakm(k);
            hmap.put(peaki(k),x);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
magc = cell(1,2);
feqc = cell(1,2);
for idx = 1:length(hmaplist)
    hmap = hmaplist(idx);
    feq = mArray(hmap.keySet); 
    mag = zeros(1,length(feq));
    for jdx = 1:length(feq)
        mag(jdx) = sum(hmap.get(feq(jdx)));
    end
    magc{idx} = mag;
    feqc{idx} = feq;
end

[~,I1] = max(magc{1});
[~,I2] = max(magc{2});
freqD = [feqc{1}(I1),feqc{2}(I2)];
%% the ppg1 should be the main
if freqD(1) == freqD(2)
   magHR = freqD(1);
else
   magHR = mixfeq(freqD(1),freqD(2));
end


%% based on the super power of wavelet 
wp = cell(1,2);
for i=1:size(peakx,1)
   wl = [];
   for j=2:size(peakx,2)
      s = setdiff(peakx{i,j}.peaki,peakx{i,j-1}.peaki);
      wl = [wl, selectNew(s,peakx{i,j}.peaki)];
   end
   wp{i} = wl;
end

wp = [wp{1},wp{2}];
if isempty(wp)
    hr = magHR;
elseif length(wp) < 3
    wpHR = closest_to(magHR,wp,1);
    hr = magHR;
else
    wpHR = mean(closest_to(magHR,wp,2));
    hr = wpHR;
end

%error:1,2,5,6,7,8,9

end

