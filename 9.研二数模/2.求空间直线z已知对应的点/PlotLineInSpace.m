%使用CalculateXYFromZ函数demo
clc;clear;
p1=[60600,69982,7995];
p2=[80,0,0];%已知的两个点坐标 
syms x y z
[x,y,z]=solve((x-p1(1))/(p2(1)-p1(1))==(y-p1(2))/(p2(2)-p1(2)), (y-p1(2))/(p2(2)-p1(2))==(z-p1(3))/(p2(3)-p1(3)), z==0);
x
y

disp('------------------------');

[R1, R2]=CalculateXYFromZ(p1,p2,0);
R1
R2