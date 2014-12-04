function wl = selectNew(cddt,base)
    % cddt = [2.125], base = [1.725,2.5] ==> OK
    if length(base) > 2
        x = zeros(1,length(base)-2);
        for i = 1:length(base)-2
            x(i) = (base(i)+base(i+2))/2;
        end
        wl = intersect(cddt,x);
    else
        wl = [];
    end
end