fnum = 1;
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = 1:length(Sig);
    pfsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

