% -------------------------------------------------------------------
%  Generated by MATLAB on 2-May-2015 21:52:40
%  《matlab教程》 P9例1.3_5
% -------------------------------------------------------------------
                                        

angle_z_degree = 70.30484646876603;

angle_z_radian = 1.227051050989076;

image_z = 5.2631397208144124;

magintude_z = 5.5901699437494736;

real_z = 1.8839745962155607;

z = 1.8839745962155607 + 5.2631397208144124i;

z1 = 4 + 3i;

z12 = 5 + 5i;

z2 = 1 + 2i;

z3 = 1.7320508075688774 + 0.99999999999999989i;

clf %打开图形窗口
hold on %用于画多个plot函数，在一个图像里面（启动图像保持功能，当前坐标轴和图形都保持，此后绘制图形）
plot([0,z1,z12],'-b','LineWidth',3)
plot([0,z12],'-r','LineWidth',3)
plot([z1,z12],'ob','MarkerSize',8)
hold off %关闭图形保持功能
grid on %打开栅栏（背景为格子虚线）
axis equal %纵、横坐标轴采用等长刻度
axis([0,6,0,6]) %设置坐标轴的最小最大值  用法：axis([xmin,xmax,ymin,ymax])
text(3.5,2.3,'z1') %在给定的坐标点（3.5,2.3）处;写上文本
text(5,4.5,'z2')
text(2.5,3.5,'z12')
xlabel('real') %x轴名称
ylabel('image') %y轴名称
