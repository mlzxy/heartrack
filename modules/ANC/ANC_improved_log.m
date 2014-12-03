function [ z ] = ANC_improved_log( y,a,order,stepsize,d )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    yorg = normalizeSig(y);
    y = y + abs(min(y))*1.01;
    a = a + abs(min(a))*1.01;
    Y = log(y);
    Y_ = Y - mean(Y);
    A = log(a);
    A = [zeros(1,d),A(1:end-d)];
    hlms = dsp.LMSFilter(order,'StepSize',stepsize);
    [W,~,~] = step(hlms,A',Y_');
    W = W';
    Z = Y_ - W;
    Z = Z + mean(Y);
    z = exp(Z);
    z = normalizeSig(z);
    
    plot(yorg,'r')
    hold on
    plot(z);
    legend('ppg','ppg after anc');
    
end

