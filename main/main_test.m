
function [estm,f] = main_test(dataNum,len)

init_glb;

membound = 0.15;
sig = Tig{dataNum};
PPG1 = 1;
PPG2 = 2;
ACCz = 5;
%%%%%%%%%%%%%%
r = [0.1,0.8,1.5];
lowb = 0.5;
highb = 3;
%%%%%%%%%%%%%%
lenr = length(r);

%%%%%%%%%%%%%%%%%%%%%%

lenpg = 2;


%%%%%%%%%%%%%%%%%%%%%%
if nargin == 1
    fnumber = frameNum(sig);
else
    fnumber = len;
end


accClass = zeros(1,fnumber);
estm = zeros(1,fnumber);
hrpeak = zeros(1,fnumber);
%%%
%fnumber = 100;
for i = 1:fnumber
    
    frame = getFrame(sig,i);
    ppg = [frame(PPG1,:);frame(PPG2,:)];
    accClass(i) = whichclass(mylpc(frame(ACCz,:),order),Center);
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
    [estm(i),hrpeak(i)] = estimate(peaks,estm,hrpeak,i,membound,accClass,frame);
    
end
clear estimate_first;
clear estimate_next;

if nargin == 1
   if exist('visible','var') && visible        
        f = figure;
    else
        f = figure('visible','off');
    end
    hold on;
    axis([1,fnumber,0,3]);
    plot(estm(1:fnumber),'r*');
   
    legend('estimated heartrate','Location','SouthEast');
    fprintf('Test Data set No %d completed\n',dataNum);
    hold off;
end


end