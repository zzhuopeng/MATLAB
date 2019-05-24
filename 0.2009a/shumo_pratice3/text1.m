clear all;
[x,y]=meshgrid(0:50:50000,-2000:50:2000); %设定网格，下风向排放点距离x米，烟气中心轴水平距离y米
Q=1160*5700/3600;%源强，释放速度
sigma_y=0.08*x./((1+0.0001*x).^0.5);%水平扩散系数(由查表可知）
sigma_z=0.06*x./((1+0.0015*x).^0.5);%垂直扩散系数(由查表可知）
u=3.2;%风速
He=75;
z=50;%高度
 
Qpi=5000*2*Q./(2*pi*u.*sigma_y.*sigma_z);%计算公式第一部分
ex1=exp(-0.5*(y./sigma_y).^2);%计算公式第二部分
ex2=exp(-0.5*((z-He)./sigma_z).^2)+exp(-0.5*((z+He)./sigma_z).^2);%计算公式第三部分
C=Qpi.*ex1.*ex2;%计算扩散气体浓度
 
mesh(x,y,C);
xlabel('x轴下风向距离/m'),ylabel('y轴距离/m'),zlabel('污染浓度');
title('21:00时空气污染浓度分布');

[Cmax,I]=max(C(:));%计算c的最大值（Cmax），并得到下标
xmax=x(I);%利用下标得到x的最大值（xmax）