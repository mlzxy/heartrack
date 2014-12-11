function [ final_error ] = printError( estm,truth )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
final_error = sum(abs(estm-truth)./truth)/length(truth);
fprintf('error: %.2f%%\n',final_error*100);
end

