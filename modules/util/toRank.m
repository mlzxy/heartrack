function r = toRank(x)
len = length(x);
p = 1:-1/len:0+1/len;
[~,I] = sort(x,'descend');
r = zeros(1,len);
for i=1:len
    r(I(i)) = p(i);
end
[~,I] = max(r);
r(I) = r(I) + 1/len*2;
end