function [x,fval,exitflag,output,population,score] = yichuan2
% This is an auto generated M-file from Optimization Tool.

% Start with the default options
options = gaoptimset;
% Modify options setting
options = gaoptimset(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga([],[],[],[],[],[],[],[],[],options);
