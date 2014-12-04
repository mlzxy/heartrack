function [ wp ] = wpDecision( peakx )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
wp = cell(1,2);
for i=1:size(peakx,1)
   wl = [];
   for j=2:size(peakx,2)
      s = setdiff(peakx{i,j}.peaki,peakx{i,j-1}.peaki);
      wl = [wl, selectNew(s,peakx{i,j}.peaki)];
   end
   wp{i} = wl;
end
wp = [wp{1},wp{2}];


end

