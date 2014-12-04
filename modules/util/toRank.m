function r = toRank(x)
len = length(x);
p = 1:-1/len:0+1/len;
[~,I] = sort(x,'descend');
r = zeros(1,len);
ri = 1;
for i=1:len
    r(ri) = p(I(i));
    ri = ri+1;
end
[~,I] = max(r);
r(I) = r(I) + 1/len*2;
end