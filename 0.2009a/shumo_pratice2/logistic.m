%logistic��������Ԥ������GDP��
clc,clear
global a b k
load y %��������GDP����� y ��
load x %����GDP����
yt=1./y; n=length(yt);m=n/2.89;
s1=sum(yt(1:m)), s2=sum(yt(m+1:2*m)), s3=sum(yt(2*m+1:end))
b=((s3-s2)/(s2-s1))^(1/m)
a=(s2-s1)*(b-1)/(b*(b^m-1)^2)
k=(s1-a*b*(b^m-1)/(b-1))/m
yu=yuce(1:n)

a=1
%����Ԥ��ͼ
plot(x,y,'-*',x,yu(1:n),'-O')
title('1979-2014������GDP��logistic��Ԥ��ͼ');
xlabel('���/year');ylabel('GDP/��Ԫ');
legend('ʵ��ֵ','Ԥ��ֵ',2)

%�����׼��
t=zeros(1,n);
for i=1:n
    t(i)=(y(i)-yu(i))^2;
end
S=sqrt(sum(t)/n)

%����������
xiangdui=zeros(1,n);
for i=1:n
    xiangdui(i)=abs(y(i)-yu(i))/y(i)*100
end

% % ************************************
% % ����Ԥ�⺯��
% % ************************************
% function y=yuce(t);
% global a b k
% y=1./(k+a*b.^t);