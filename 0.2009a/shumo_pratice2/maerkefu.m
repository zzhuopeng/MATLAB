format rat %使用分数表示
clc,clear
%a=[4	2	4	2	2	5	5	3	2	1	4	3	2	5	2	2	1	2 4 3];%1
%a=[3 2 4 3 3 5 5 3 2 1 4 4 2 5 3 3 2 3 5];%原
a=[3
2
4
3
3
5
5
3
2
1
4
4
2
5
3
3
2
3
5
4
];%2
a=a';
for i=1:5
    for j=1:5
        f(i,j)=length(findstr([i j],a))
    end
end
%f'
ni=sum(f');
for i=1:5
    p(i,:)=f(i,:)/ni(i);
end
p

V0=[1 0 0 0 0];
V1=V0*p
V2=V1*p
V3=V2*p
V4=V3*p
V5=V4*p;
V6=V5*p;
V7=V6*p;
V8=V7*p;
V9=V8*p;
V10=V9*p;
V11=V10*p;
V12=V11*p;
V13=V12*p;
V14=V13*p;
V15=V14*p;
V16=V15*p;
V17=V16*p;