%���㸽¼2��ƽ����Ȩ�ܷ֡�
%ʱ�䣺2015��5��9��21:02:11

%�����ÿƪ���ĸ���ָ�������ƽ��ֵ�����ÿƪ���ĸ���ָ��ļ�Ȩ��ķ�����
a=[75,75,75,75,85,75,85,75,85,75,85,85,75,75,85,75,75,75,85,75,75,85,85,85,75,85,75,75,85,75,75,85,85,85,85,75,75,85,75,85,75,85,75,75,85,85,75,75,85,85,85,75,75,85,75,60,75,75,75,75,75,75,85,85,75,75,75,75,85,75,85,85];
A=zeros(1,36);
for i=1:2:72
    A((i+1)/2)=(a(i)+a(i+1))/2
end
A=A*0.132

b=[75,75,60,0,75,75,75,75,85,75,75,85,85,75,75,75,75,60,75,75,75,75,75,85,75,75,75,75,75,60,85,85,75,85,75,75,75,75,75,75,75,75,75,60,60,60,75,75,75,85,75,75,75,75,60,75,75,75,75,75,75,60,85,75,75,75,75,0,75,75,85,75];
B=zeros(1,36);
for i=1:2:72
    B((i+1)/2)=(b(i)+b(i+1))/2
end
B=B*0.210

c=[85,75,60,60,75,60,75,60,85,60,75,75,75,75,75,75,75,75,75,75,75,75,85,85,75,75,85,75,85,60,85,85,75,85,75,75,75,75,75,75,75,75,75,60,75,75,75,75,85,60,75,75,75,75,85,75,75,75,75,60,75,85,75,75,75,85,85,60,60,60,85,85];
C=zeros(1,36);
for i=1:2:72
    C((i+1)/2)=(c(i)+c(i+1))/2
end
C=C*0.0264

d=[75,75,60,75,75,60,85,75,85,60,75,75,75,60,60,75,75,60,85,75,75,75,75,75,75,75,75,75,85,60,75,75,75,85,75,60,75,75,75,60,75,75,75,60,75,75,75,75,85,60,85,75,75,85,75,75,75,75,75,75,75,75,75,60,75,75,85,0,75,75,85,85];
D=zeros(1,36);
for i=1:2:72
    D((i+1)/2)=(d(i)+d(i+1))/2
end
D=D*0.2524

e=[75,75,60,75,75,60,75,75,85,60,75,75,75,75,60,75,75,75,75,75,75,75,85,85,75,75,85,75,85,75,85,85,75,85,75,60,75,85,75,60,75,75,75,60,75,75,75,75,75,75,85,75,75,75,75,60,75,75,75,75,75,75,85,75,75,75,85,60,75,75,85,85];
E=zeros(1,36);
for i=1:2:72
    E((i+1)/2)=(e(i)+e(i+1))/2
end
E=E*0.2736

f=[60,75,75,85,75,75,85,75,85,60,75,85,85,75,75,75,75,85,85,75,75,75,85,85,75,85,85,75,85,75,85,85,75,85,75,75,75,85,75,75,75,75,85,60,75,75,85,75,85,75,85,75,75,75,85,75,75,75,75,75,75,85,85,75,75,85,85,75,85,85,85,60];
F=zeros(1,36);
for i=1:2:72
    F((i+1)/2)=(f(i)+f(i+1))/2
end
F=F*0.0528

g=[75,75,60,75,75,60,75,75,85,75,75,75,75,60,75,75,60,75,85,75,75,75,75,60,75,75,85,75,75,60,85,75,75,85,75,75,85,75,85,75,75,75,75,60,75,60,85,75,75,60,75,75,75,75,85,60,75,75,75,75,75,85,85,75,75,85,85,0,85,75,85,60];
G=zeros(1,36);
for i=1:2:72
    G((i+1)/2)=(g(i)+g(i+1))/2
end
G=G*0.0528

%���ÿƪ���ĵ�ƽ����ļ�Ȩ������
H=zeros(1,36);
for i=1:36
    H(i)=A(i)+B(i)+C(i)+D(i)+E(i)+F(i)+G(i)
end