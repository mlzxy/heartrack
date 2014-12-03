%load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02.mat');
%load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02_BPMtrace.mat');
num = 1;
frame = getFrame(sig,num);
ppg1 = frame(2,:);
acc = frame(4,:);
d = 4;

fsuspect(ppg1,BPM0,num);
legend(strcat('before ANC with d = ',int2str(d)));

[z] = old_ANC(ppg1,acc,d);


fsuspect(z',BPM0,num);
legend(strcat('after ANC with d = ',int2str(d)));