%������ָ��ƽ������Ԥ�������н�ˮ��
format short
clc,clear
load jiangyuliang.txt %ԭʼ�������������ķ�ʽ����ڴ��ı��ļ���
load jiangyuliang_year.txt
yt=jiangyuliang; n=length(yt);
alpha=0.545; st1(1)=yt(1); st2(1)=yt(1);
for i=2:n
st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
%xlswrite('fadian.xls',[st1',st2'])
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2)
yhat=a+b;
%xlswrite('fadian.xls',yhat','Sheet1','C2')
plot(jiangyuliang_year,yt,'-*',jiangyuliang_year,yhat(1:n),'-O')
title('1980-2014���ս�����������ָ��ƽ������Ԥ��');
xlabel('���/year');ylabel('������/0.1mm');
legend('ʵ��ֵ','Ԥ��ֵ',2)
s=yhat
for i=1:37
s(n+i)=a(n)+i*b(27); 
end %���Ԥ������
s(26)%2020
s(56)%2050