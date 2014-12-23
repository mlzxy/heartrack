fnum = 23;
r = 1.5;
ppg1 = 2;
ppg2 = 3;
whichone = [10];
init;
%channel = ppg1;
channel = ppg1;
for i = whichone;
    pfsuspect(Sig{i},Hr{i},fnum,r,channel);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  after wavelet'));
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  raw'));
end

