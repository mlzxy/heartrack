fnum = 24;
r = 0.3;
whichone = [1];
init;
for i = whichone;
    pfsuspect(Sig{i},Hr{i},fnum,r);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  after wavelet'));
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum),'  raw'));
end

