init;
close all;
ppg1 = 2; ppg2 = 3;
numlist = 6;
channel = ppg1;
for i = numlist;
    sig = Sig{i};
    hr = Hr{i}/60;
    fnumber = frameNum(sig);
    mag = zeros(1,fnumber);
    for j = 1:fnumber
        frame = getFrame(sig,j);
        mag(j) = sum(abs(frame(channel,:)));
    end
    figure;
    hold on;
    plot(hr,'blue*');
    plot(mag/max(mag)*2,'blacko');
    legend('heart rate','ppg magnitude');
    hold off;
end