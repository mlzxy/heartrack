function fsuspect( sig,BPM0,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    global window Fs
   
   
   if size(sig,1) > 1 && size(sig,2) > window
        frame = getFrame(sig,n);
        ppg1 = frame(2,:);
   elseif size(sig,1) == 1
        ppg1 = sig;
   else
        frame = sig;
        ppg1 = frame(2,:);
   end
   figure;
   x = 0:Fs/window:Fs-Fs/window;
   fppg = abs(fft(ppg1));
   plot(x(1:window/2),fppg(1:window/2),'b');
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

