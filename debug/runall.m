load('/home/beviszhang/Documents/WorkSpace/newIEEE/data/alldata.mat');
num = 12;
errlist = zeros(1,num);
for i = 1:num;
    [~,errlist(i)] = main(i);
end
