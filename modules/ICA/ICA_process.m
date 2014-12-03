function [ z ] = ICA_process( sig,num )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    frame = getFrameica(sig,num);
  % fsuspect(sig,BPM0,num);
  %  legend('before ICA');
    [frame] = fastica(frame);
    f = zeros(size(frame));
    for i = 1:size(frame,1)
        f(i,:) = abs(fft(frame(i,:)));
    end
    sel = zeros(1,size(frame,1));
    for i =1:length(sel)
        sel(i) = sum(f(i,1:4))/sum(f(i,:));
    end
    [~,I] = min(sel);
    z = frame(I,:);
end

