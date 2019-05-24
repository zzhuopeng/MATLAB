clear;clc;
%% 使用自定义函数add(a,b)，并打印计算结果。
% result = add(1,1)
% result = add(2,2)

%% 将自定义函数add(a,b)作为函数参数，调用multiply(f,c)函数
f=@add; %相当于把add声明为一个指针
result = multiply(f,2)

