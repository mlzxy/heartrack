
function [estm,err] = main(dataNum)

close all;
init;
membound = 0.15;
sig = Sig{dataNum};
hr = Hr{dataNum};
PPG1 = 2;
PPG2 = 3;

%%%%%%%%%%%%%%
r = [0.1,0.8,1.5];
lowb = 0.5;
highb = 3;
%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%

lenpg = 2;


%%%%%%%%%%%%%%%%%%%%%%
fnumber = frameNum(sig);
estm = zeros(1,fnumber);
%%%
%fnumber = 100;
for i = 1:fnumber
    lenr = length(r);
    frame = getFrame(sig,i);
    ppg = [frame(PPG1,:);frame(PPG2,:)];
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
            peaki = peaki - 1;
            peaki = toFreq(peaki);
            peakm = peakm(peaki>lowb & peaki < highb);
            peaki = peaki(peaki>lowb & peaki < highb);
            temp.peaki = peaki;
            temp.peakm = peakm;
            peaks{k,j} = temp;
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    estm(i) = estimate(peaks,estm,i,membound);

end

hold on;
plot(hr(1:fnumber)/60,'b*');
plot(estm(1:fnumber),'r*');
legend('true heartrate','estimated heartrate');
fprintf('Data set No %d: ',dataNum);
err = printError(estm(1:fnumber)',hr(1:fnumber)/60);

end