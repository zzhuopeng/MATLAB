clc,clear
load sw.txt %原始数据以列向量的方式存放在纯文本文件中
load sea_year.txt
yt=sw; n=length(yt);
alpha=0.6; st1_0=mean(yt(1:3)); st2_0=st1_0;st3_0=st1_0;
st1(1)=alpha*yt(1)+(1-alpha)*st1_0;
st2(1)=alpha*st1(1)+(1-alpha)*st2_0;
st3(1)=alpha*st2(1)+(1-alpha)*st3_0;
for i=2:n
st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
st3(i)=alpha*st2(i)+(1-alpha)*st3(i-1);
end
%xlswrite('touzi.xls',[st1',st2',st3'])
st1=[st1_0,st1];st2=[st2_0,st2];st3=[st3_0,st3];
a=3*st1-3*st2+st3;
b=0.5*alpha/(1-alpha)^2*((6-5*alpha)*st1-2*(5-4*alpha)*st2+(4-3*alpha)*st3);
c=0.5*alpha^2/(1-alpha)^2*(st1-2*st2+st3);
yhat=a+b+c;
%xlswrite('touzi.xls',yhat','Sheet1','D1')
plot(sea_year,yt,'-*',sea_year,yhat(1:n),'-O')
title('1995-2014年海平面高度“三次指数平滑法”预测');
xlabel('年份/year');ylabel('高度/mm');
legend('实际值','预测值',2)
xishu=[c(n+1),b(n+1),a(n+1)];
yhat1990=polyval(xishu,2)