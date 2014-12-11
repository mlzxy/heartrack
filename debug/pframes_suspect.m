fnum = 22;
r = 0.3;
whichone = [1];
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = whichone;
    pfsuspect(Sig{i},Hr{i},fnum,r);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  after wavelet'));
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  raw'));
end

