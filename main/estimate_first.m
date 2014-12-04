function [ hr ] = estimate_first( peakx )


global Fs window;

freqD = magDecision(peakx);

if freqD(1) == freqD(2)
   magHR = freqD(1);
else
   magHR = mixfeq(freqD(1),freqD(2));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wp = wpDecision(peakx);

if isempty(wp)
    hr = magHR;
elseif length(wp) < 3
    wpHR = closest_to(magHR,wp,1);
    hr = magHR;
else
    wpHR = mean(closest_to(magHR+Fs/window/1.5,wp,2));
    hr = wpHR;
end

end

