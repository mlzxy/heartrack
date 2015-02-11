init;
num = 13;
errlist = zeros(1,num);
path = '/home/xyzhang/Documents/Sp Cup/newIEEE/doc/figs/train/';
for i = 1:num;
    [~,errlist(i),f] = main(i);
    title(strcat('Data Set:',int2str(i), ' error rate:  ', num2str(errlist(i)*100), '%'));
    saveas(f,strcat(path,'Train-',int2str(i)),'jpg');
end
