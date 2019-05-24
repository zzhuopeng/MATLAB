% clc,clear
% a=[390.6,412,320,559.2,380.8,542.4,553,310,561,300,632,540,406.2,313.8,576,587.6,318.5]';
% t0=find(a<=320);
% t1=cumsum(t0);n=length(t1);
% B=[-0.5*(t1(1:end-1)+t1(2:end)),ones(n-1,1)];Y=t0(2:end);
% r=B\Y
% y=dsolve('Dy+a*y=b','y(0)=y0');
% y=subs(y,{'a','b','y0'},{r(1),r(2),t1(1)});
% yuce1=subs(y,'t',[0:n+1])
% digits(6),y=vpa(y) %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ�
% yuce=diff(yuce1);
% yuce=[t0(1),yuce]

%��ɫԤ�⣺Verhulst ģ��
clc,clear
x1=[4.93 5.33 5.87 6.35 6.63 7.15 7.37 7.39 7.81 8.35 9.39 10.59 10.94 10.44];
n=length(x1);
nian=1990:2003;
plot(nian,x1,'o-');
x0=diff(x1);
x0=[x1(1),x0]
for i=2:n
    z1(i)=0.5*(x1(i)+x1(i-1));
end
z1
B=[-z1(2:end)',z1(2:end)'.^2]
Y=x0(2:end)'
abhat=B\Y %���Ʋ��� a,b ��ֵ
x=dsolve('Dx+a*x=b*x^2','x(0)=x0'); %��ⳣ΢�ַ���
x=subs(x,{'a','b','x0'},{abhat(1),abhat(2),x1(1)}); %�������ֵ
yuce=subs(x,'t',0:14) %����Ԥ��ֵ
digits(6); x=vpa(x) %��ʾ΢�ַ��̵Ľ⣬Ϊ����߼��㾫�ȣ��Ѹ������ڼ���Ԥ��ֵ֮�󣬻��߲�ʹ�ø����
yuce(16)=yuce(15)
x1_all=[x1,9.92,10.71];

epsilon=x1_all-yuce %����в�
delta=abs(epsilon./x1_all) %����������
delta_mean=mean(delta) %����ƽ��������
x1_all_0=x1_all-x1_all(1); %�����е�ʼ���㻯��
yuce_0=yuce-yuce(1); %�����е�ʼ���㻯��
s0=abs(sum(x1_all_0(1:end-1))+0.5*x1_all_0(end));
s1=abs(sum(yuce_0(1:end-1))+0.5*yuce_0(end));
tt=yuce_0-x1_all_0;
s1_s0=abs(sum(tt(1:end-1))+0.5*tt(end));
absdegree=(1+s0+s1)/(1+s0+s1+s1_s0) %�����ɫ���Թ�����
% c=std(epsilon,1)/std(x1_all,1) %�����׼���ֵ