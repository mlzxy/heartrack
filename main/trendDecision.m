function [ hr ] = trendDecision(hr, hrpeak,estm,idx,freqC)
%%% take the trend of heart rate (not the peak freq) into account 
%%% should have nothing to do with the peak
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tlen = 7;
    gdbound = 0;
    if idx < tlen+1
        return;
    end
    prev_peak = hrpeak(idx-1);
    prev_hr = estm(idx-1);
    estmgd = dgrad(estm);
    estmgd = estmgd(idx-tlen:idx-1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    estm_trend = estmgd(estmgd >= 0);
    freqM = freqC(freqC > prev_peak);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%% CASE : hr increase trend, but current peak decrease %%%%%%%%%
    if length(estmgd) == length(estm_trend) 
        if hr < prev_hr - 0.09 && mean(estmgd) > gdbound && ~isempty(freqM)
            hr = freqM(1);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

