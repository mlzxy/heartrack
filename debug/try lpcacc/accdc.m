init;
whichone = 1:12;
ax = 4;
ay = 5;
az = 6;
am = 7; 
acx = 1;
acy = 2;
acz = 3;
acm = 4;
alist = [ax,ay,az,am];
Alpcell = cell(1,4);
Acell = cell(1,4);
Aclucell = cell(1,4);
C = cell(1,4);
for i = whichone;
   sig = Sig{i};
   fnumber = frameNum(sig);
   %=============================%
   for j = 1:fnumber
        frame = getFrame(Sig{i},j);
        for k = 1:4
            Acell{k} = [Acell{k};frame(alist(k),:)];
        end
   end
end


for i = 1:length(Acell)
   Ac = Acell{i};
   A = zeros(size(Ac,1),order+1);
   for j = 1:size(Ac,1)
       [a,g] = lpc(Ac(j,:),order);
       a = [g,a(2:end)];
       A(j,:) = a;
   end
   Alpcell{i} = A;
end


for i = 1:length(Alpcell)
    [Aclucell{i},C{i}] = kmeans(Alpcell{i},K);
end


acellpath = 'accDataAll.mat';
save(acellpath, 'Acell' ,'acx' ,'acy', 'acz' ,'acm','Alpcell','Aclucell','C');
