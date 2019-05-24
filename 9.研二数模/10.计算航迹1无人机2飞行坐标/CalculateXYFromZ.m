function [ x, y ] = CalculateXYFromZ( p1,p2,zNum)
%   输入两点和z，计算空间中直线z对应点的xy
x  = (zNum - p1(3))/(p2(3) - p1(3))*(p2(1) - p1(1)) + p1(1);
y  = (zNum - p1(3))/(p2(3) - p1(3))*(p2(2) - p1(2)) + p1(2);

end

