init;
%%% use az
Center = C{3};
aidx = 6;
numlist = 1:12;
errlist = zeros(1,12);
for i = numlist;
    [~,errlist(i)] = main(i);
    hold on;
    sig = Sig{i};
    fnumber = frameNum(sig);
    classList = zeros(1,fnumber);
    for j = 1:fnumber
        frame = getFrame(sig,j);
        
        classList(j) = whichclass(mylpc(frame(aidx,:),order),Center);
    end
    plot(classList*0.75,'blacko');
    legend(strcat('Use ACC! Data Set ',int2str(i)));
    hold off;
end
