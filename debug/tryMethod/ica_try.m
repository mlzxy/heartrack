%load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02.mat');
%load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02_BPMtrace.mat');
num = 1;
frame = getFrameica(sig,num);

fsuspect(sig,BPM0,num);
legend('before ICA');

[z] = fastica(frame);



for i = 1:size(z,1)
    fsuspect(z(i,:),BPM0,num);
    legend(strcat('after ICA with idx = ',int2str(i)));
end