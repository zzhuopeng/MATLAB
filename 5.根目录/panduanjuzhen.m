%% ��η������������жϾ��󣬼������ָ���Ȩ�ء�
format short %�������ݵľ��ȡ�
%���������������
clc,clear  
%��������
fid=fopen('data.txt','r');  
%�ڶ����������ָ������
n1=3;n2=5; 
%����һ�������顣
a=[]; 
for i=1:n1
    tmp=str2num(fgetl(fid));
    %���ڶ����жϾ���
    a=[a;tmp]; 
end

for i=1:n1
    str1=char(['b',int2str(i),'=[];']);
    str2=char(['b',int2str(i),'=[b',int2str(i),';tmp];']);
    eval(str1);
    for j=1:n2
        tmp=str2num(fgetl(fid));
        %����������жϾ���
        eval(str2); 
    end
end

ri=[0
0
0.58
0.9
1.12
1.24
1.32
1.41
1.45
]; %һ����ָ��
ri=ri';


for i=1:n1
    [u,v]=eig(eval(char(['b',int2str(i)])));
    lam=max(diag(v));
    number=find(diag(v)==lam);
    w1(:,i)=u(:,number)/sum(u(:,number));
    cr1(i)=(lam-n2)/(n2-1)/ri(n2);
end


[u,v]=eig(a);
lam=max(diag(v));
number=find(diag(v)==lam);

w0=u(:,number)/sum(u(:,number));
cr0=(lam-n1)/(n1-1)/ri(n1)

%�������������
cr1, cr=cr1*w0,ts=w1*w0