%��������
function plotSector(x0,y0,angle1,angle2)
%(x0,y0)Ϊ����ԭ�㣬(angle1,angle2)Ϊ�����Ž�
t=linspace(angle1,angle2,100);
x=cos(t);y=sin(t);
fill([x0 x],[y0 y],'r')
axis([x0-1 x0+1 y0-1 y0+1])