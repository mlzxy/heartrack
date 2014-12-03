fnum = 18;
load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
for i = 1:length(Sig);
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

