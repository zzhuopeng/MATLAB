%��ƽ��߶�Ԥ�����
clc,clear
load sw.txt %ԭʼ�������������ķ�ʽ����ڴ��ı��ļ���
load sea_year.txt
yt=sw; n=length(yt);
alpha=0.6; st1(1)=yt(1); st2(1)=yt(1);
for i=2:n
st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
%xlswrite('fadian.xls',[st1',st2'])
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2)
yhat=a+b;
%xlswrite('fadian.xls',yhat','Sheet1','C2')
plot(sea_year,yt,'-*',sea_year,yhat(1:n),'-O')
title('1995-2014�꺣ƽ��߶ȡ�����ָ��ƽ������Ԥ��');
xlabel('���/year');ylabel('�߶�/mm');
legend('ʵ��ֵ','Ԥ��ֵ',2)
s=yhat
for i=1:37
s(n+i)=a(n)+i*b(round(n/2)-1); 
end %���Ԥ������
s(26)%2020
s(56)%2050
