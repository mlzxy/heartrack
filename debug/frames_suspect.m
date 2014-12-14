fnum = 18;
init;
for i = 1:length(Sig);
    fsuspect(Sig{i},Hr{i},fnum);
    legend(strcat('Data set:',int2str(i),' Frame num:',int2str(fnum)));
end

