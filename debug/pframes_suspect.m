fnum = 18;
r = 0.3;
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = 1:length(Sig);
    pfsuspect(Sig{i},Hr{i},fnum,r);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

