function [z] = ANC_improved_add(y,a,d)
    order = 32;
    stepsize = 0.05;
    y_ = y-mean(y);
    a = [zeros(1,d),a(1:end-d)];
    hlms = dsp.LMSFilter(order,'StepSize',stepsize);
    [w,~,~] = step(hlms,a',y_');
    w = w';
    z = y_ - w;
    z = z + mean(y);
end



