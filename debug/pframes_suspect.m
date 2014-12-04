fnum = 1;
r = 0.3;
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = [2,4,5,8,9,12];
    pfsuspect(Sig{i},Hr{i},fnum,r);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

