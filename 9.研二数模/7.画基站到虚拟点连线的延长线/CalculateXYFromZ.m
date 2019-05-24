function [ x, y ] = CalculateXYFromZ( p1,p2,zNum)
%   输入两点和z，计算空间中直线z对应点的xy
syms x y z
[x,y,z]=solve((x-p1(1))/(p2(1)-p1(1))==(y-p1(2))/(p2(2)-p1(2)), (y-p1(2))/(p2(2)-p1(2))==(z-p1(3))/(p2(3)-p1(3)), z==zNum);
subs(x); %符号变量转数值
subs(y);

end

