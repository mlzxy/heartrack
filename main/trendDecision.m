function [ freqM ] = trendDecision(freqM,hrpeak,estm,idx,freqC)
%%% take the trend of heart rate (not the peak freq) into account 
%%% should have nothing to do with the peak
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tlen = 4;
    gdbound = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if idx < tlen+1
        return;
    end
    prev_hr = estm(idx-1);
    estmgd = dgrad(estm);
    estmgd = estmgd(end-tlen:end);
    hrpeakgd = dgrad(hrpeak);
    hrpeakgd = hrpeakgd(end-tlen:end);
    
    estm_trend = estmgd(estmgd >= 0);
    hrpeak_trend = hrpeakgd(hrpeakgd == 0);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%% CASE : hr increase trend, but current peak decrease %%%%%%%%%
    if length(estmgd) == length(estm_trend)  && length(hrpeak_trend) == length(hrpeakgd)
        if freqM < prev_hr && mean(estmgd) > gdbound
            freqM = freqC(freqC > freqM);
            freqM = freqM(1);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

