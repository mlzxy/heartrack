dataNum = 2;
sig = Sig{dataNum};
hr = Hr{dataNum};
Win = 1000;
Fs = 125;
Step = 250;
fnumber = frameNum(sig,Win,Step);

for i = 1:fnumber
   frame = getFrame(sig,i); 
    
    
    
end