%绘制扇形
function plotSector(x0,y0,angle1,angle2)
%(x0,y0)为扇形原点，(angle1,angle2)为扇形张角
t=linspace(angle1,angle2,100);
x=cos(t);y=sin(t);
fill([x0 x],[y0 y],'r')
axis([x0-1 x0+1 y0-1 y0+1])