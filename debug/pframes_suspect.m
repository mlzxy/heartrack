fnum = 1;

for n = 1:12
    if n<10
        s = strcat('0',int2str(n));
    else
        s = int2str(n);
    end
    load(strcat('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_',s,'_TYPE02.mat'));
    load(strcat(strcat('/home/beviszhang/Documents/WorkSpace/IEEE/competition_data/DATA_',s),'_TYPE02_BPMtrace.mat'));
    
    pfsuspect(s,fnum);
    legend(strcat('Data set:',s,' Frame num:',int2str(fnum)));
end

