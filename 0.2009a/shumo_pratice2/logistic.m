%logistic生长曲线预测深圳GDP。
clc,clear
global a b k
load y %深圳历年GDP存放在 y 中
load x %深圳GDP年数
yt=1./y; n=length(yt);m=n/2.89;
s1=sum(yt(1:m)), s2=sum(yt(m+1:2*m)), s3=sum(yt(2*m+1:end))
b=((s3-s2)/(s2-s1))^(1/m)
a=(s2-s1)*(b-1)/(b*(b^m-1)^2)
k=(s1-a*b*(b^m-1)/(b-1))/m
yu=yuce(1:n)

a=1
%画出预测图
plot(x,y,'-*',x,yu(1:n),'-O')
title('1979-2014年深圳GDP“logistic”预测图');
xlabel('年份/year');ylabel('GDP/亿元');
legend('实际值','预测值',2)

%计算标准差
t=zeros(1,n);
for i=1:n
    t(i)=(y(i)-yu(i))^2;
end
S=sqrt(sum(t)/n)

%计算相对误差
xiangdui=zeros(1,n);
for i=1:n
    xiangdui(i)=abs(y(i)-yu(i))/y(i)*100
end

% % ************************************
% % 定义预测函数
% % ************************************
% function y=yuce(t);
% global a b k
% y=1./(k+a*b.^t);