%"三次指数平滑法"预测深圳市GDP
clc,clear
load y %深圳GDP
load x %深圳年份
yt=y; n=length(yt);
alpha=0.3; st1_0=mean(yt(1:3)); st2_0=st1_0;st3_0=st1_0;
st1(1)=alpha*yt(1)+(1-alpha)*st1_0;
st2(1)=alpha*st1(1)+(1-alpha)*st2_0;
st3(1)=alpha*st2(1)+(1-alpha)*st3_0;
for i=2:n
st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);    %一次平滑值
st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);  %二次平滑值
st3(i)=alpha*st2(i)+(1-alpha)*st3(i-1);  %三次平滑值
end
%xlswrite('touzi.xls',[st1',st2',st3'])
st1=[st1_0,st1];st2=[st2_0,st2];st3=[st3_0,st3];
a=3*st1-3*st2+st3;
b=0.5*alpha/(1-alpha)^2*((6-5*alpha)*st1-2*(5-4*alpha)*st2+(4-3*alpha)*st3);
c=0.5*alpha^2/(1-alpha)^2*(st1-2*st2+st3);
yhat=a+b+c;

%xlswrite('touzi.xls',yhat','Sheet1','D1')
plot(x,yt,'-*',x,yhat(1:n),'-O')
title('1979-2014年深圳GDP“三次指数平滑法”预测图');
xlabel('年份/year');ylabel('GDP/亿元');
legend('实际值','预测值',2)

%计算标准差
t=zeros(1,n);
for i=1:n
    t(i)=(yt(i)-yhat(i))^2;
end
S=sqrt(sum(t)/n)
%计算相对误差
xiangdui=zeros(1,n);
for i=1:n
    xiangdui(i)=abs(yt(i)-yhat(i))/yt(i)*100;
end

%预测GDP
xishu=[c(n+1),b(n+1),a(n+1)]
yhat2020=polyval(xishu,6)
yhat2050=polyval(xishu,36)