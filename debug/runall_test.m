init;
num = 10;
path = strcat(saveImgTo,'test/');
for i = 1:num;
    [~,f] = main_test(i);
    switch(i)
        case 1
           title('TEST S01 T01');
        case 2
           title('TEST S02 T01');
        case 3
            title('TEST S02 T02');
        case 4        
            title('TEST S03 T02');
        case 5
            title('TEST S04 T02');
        case 6
            title('TEST S05 T02');
        case 7
            title('TEST S06 T01');
        case 8
            title('TEST S06 T02');
        case 9
            title('TEST S07 T02');
        case 10
            title('TEST S08 T01');
    end    
    saveas(f,strcat(path,'Test-',int2str(i)),'jpg');
end
