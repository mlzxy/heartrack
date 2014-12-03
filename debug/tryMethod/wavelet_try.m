load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02.mat');
load('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_10_TYPE02_BPMtrace.mat');
num = 1;
frame = getFrame(sig,num);
ppg1 = frame(3,:);
%%%%%%%%%%%%%%%%%%%%%%
level = 7;
method = 'db1';
%%%%%%%%%%%%%%%%%%%%%%

fsuspect(ppg1,BPM0,num);
legend(strcat('before wavelet: ',method));
%     'haar'   : Haar wavelet.
%     'db'     : Daubechies wavelets.
%     'sym'    : Symlets.
%     'coif'   : Coiflets.
%     'bior'   : Biorthogonal wavelets.
%     'rbio'   : Reverse biorthogonal wavelets.
%     'meyr'   : Meyer wavelet.
%     'dmey'   : Discrete Meyer wavelet.
%     'gaus'   : Gaussian wavelets.
%     'mexh'   : Mexican hat wavelet.
%     'morl'   : Morlet wavelet.
%     'cgau'   : Complex Gaussian wavelets.
%     'cmor'   : Complex Morlet wavelets.
%     'shan'   : Complex Shannon wavelets.
%     'fbsp'   : Complex Frequency B-spline wavelets.

[C,L] = wavedec(ppg1,level,method);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


C = mul_level(C,L,0,0);
C = mul_level(C,L,1,0);
C = threshold_level( C,L);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ppg1_w = waverec(C,L,method);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
fsuspect(ppg1_w,BPM0,num);
legend(strcat('after wavelet: ',method));