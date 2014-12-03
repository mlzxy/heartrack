function r = toRank(x)
len = length(x);
p = 0:1/len:1;
[~,I] = sort(x);
r = p(I);
end