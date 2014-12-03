function pfsuspect( sig,BPM0,n ,r)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    Fs = 125;
    window = 1000;
    
   
   if size(sig,1) > 1 && size(sig,2) > 1000
        frame = getFrame(sig,n);
        ppg1 = frame(2,:);
   elseif size(sig,1) == 1
        ppg1 = sig;
   else
        frame = sig;
        ppg1 = frame(2,:);
   end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   ppg1 = wavelet_process(ppg1,r);
   
   
   
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   figure;
   x = 0:Fs/window:125-Fs/window;
   fppg = abs(fft(ppg1));
   plot(x(1:500),fppg(1:500),'b');
   hold on;
   hr = BPM0(n)/60;
   
   %%%%%%%%%%%%%%%%%%%%%%%%
   nb = x(abs(x-hr)<Fs/window);
   nbidx = nb/Fs*window+1;
   %%%%%%%%%%%%%%%%%%%%%%%%
   jx = [0.5,3];
   jxidx = jx/Fs*window+1;
   
   stem(hr,0,'black*');
   stem(nb,fppg(nbidx),'m*');
   stem(jx,fppg(jxidx),'black*');
   hold off;
end

