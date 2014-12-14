init;
num = 12;
errlist = zeros(1,num);
for i = 1:num;
    [~,errlist(i)] = main(i);
end
