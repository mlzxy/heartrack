fnum = 1;
r = 0.3;
whichone = [10];
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = whichone;
    pfsuspect(Sig{i},Hr{i},fnum,r);
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

