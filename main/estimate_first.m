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
        peakm = toRank(p.peakm);
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
    if freqD(2)>freqD(1)
        magHR = freqD(1)+Fs/window/1.5;
    else
        magHR = freqD(1)-Fs/window/1.5;
    end
end


%% based on the super power of wavelet 
wp = cell(1,2);
for i=1:size(peakx,1)
   for j=2:size(peakx,2)
      s = setdiff(peakx{i,j},peakx{i,j-1});
      wl = selectNew(s,peakx{i,j});
   end
   wp{i} = wl;
end


end

