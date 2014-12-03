%%%magnitude
magc = cell(1,2);
feqc = cell(1,2);
for idx = 1:length(hmaplist)
    hmap = hmaplist(idx);
    feq = mArray(hmap.keySet); 
    mag = zeros(1,length(feq));
    for jdx = 1:length(feq)
        mag(jdx) = sum(hmap.get(feq(jdx)));
    end
    magc{idx} = mag;
    feqc{idx} = feq;
end
1