dataNum = 2;
sig = Sig{dataNum};
hr = Hr{dataNum};
Win = 1000;
Fs = 125;
Step = 250;
PPG1 = 2;
PPG2 = 3;

%%%%%%%%%%%%%%
r = [0.3,0.8,1.5];
lowb = toIdx(0.5);
highb = toIdx(3);
%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%
lenr = length(r);
lenpg = 2;


%%%%%%%%%%%%%%%%%%%%%%
fnumber = frameNum(sig,Win,Step);
estm = zeros(1,fnumber);
for i = 1:fnumber
   frame = getFrame(sig,i); 
   ppg = [frame(PPG1,:),frame(PPG2,:)];
   ppg_m = cell(2,lenr);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for j = 1:lenr
        for k = 1:lenpg
           ppg_m{k,j} = abs(fft(wavelet_process(ppg(k,:),r(j))));
        end
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   peaks = cell(2,lenr);
   for j = 1:lenr
       for k = 1:lenpg
           [peaki,peakm] = peakfinder(ppg_m{k,j},0);
           peakm = peakm(peaki>lowb & peaki < highb);
           peaki = peaki(peaki>lowb & peaki < highb);
           temp.peaki = peaki;
           temp.peakm = peakm;
           peaks{k,j} = temp;
       end
   end
   estm(i) = estimate(peakx,estm,i);

end