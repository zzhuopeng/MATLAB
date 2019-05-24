%% 计算第一问（模型二）的结果。
clc;clear;
load quanzhong2
load quanzhong3

% zhibiao=[0.7 0.7 0.7 1.0 0.7]; %问题二，改进之后的数据。
% zhibiao=[0.7 0.6 0.6 1.0 0.7]; %问题二，改进之前的数据。

% zhibiao=[0.7 0.6 0.6 1.0 0.7]; %问题一，北京数据。
% zhibiao=[0.7 0.7 0.8 1.0 0.9]; %问题一，大连数据。
% zhibiao=[1.0 0.5 0.6 0.8 0.7]; %问题一，贵阳数据。

%  zhibiao=[0.7 0.7 0.6 0.7 0.7]; %大连不同时间段，高峰期。
zhibiao=[0.7 0.7 1.0 0.7 0.9]; %大连不同时间段，平峰期。
zhibiao=zhibiao';

a=w0(1).*zhibiao.*w1(:,1);
b=w0(2).*zhibiao.*w1(:,2);
c=w0(3).*zhibiao.*w1(:,3);

jieguo=sum(a)+sum(b)+sum(c)