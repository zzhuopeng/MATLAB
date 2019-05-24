%% 层次分析法，根据判断矩阵，计算各个指标的权重。
format short %声明数据的精度。
%清除命令，清除变量。
clc,clear  
%导入数据
fid=fopen('data.txt','r');  
%第二层与第三层指标数。
n1=3;n2=5; 
%定义一个空数组。
a=[]; 
for i=1:n1
    tmp=str2num(fgetl(fid));
    %读第二层判断矩阵
    a=[a;tmp]; 
end

for i=1:n1
    str1=char(['b',int2str(i),'=[];']);
    str2=char(['b',int2str(i),'=[b',int2str(i),';tmp];']);
    eval(str1);
    for j=1:n2
        tmp=str2num(fgetl(fid));
        %读第三层的判断矩阵
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
]; %一致性指标
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

%计算所需变量。
cr1, cr=cr1*w0,ts=w1*w0