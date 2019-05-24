clc;
clear;
x=xlsread('data.xlsx','sheet1','A1:A20')
y=xlsread('data.xlsx','sheet1','B1:B20')
z=xlsread('data.xlsx','sheet1','C1:C20')
figure()
grid on ;
plot3(x,y,z,'b')
hold on;
plot3(80000,0,0,'ko')
text(80000+700,0+700,0,'雷达2')
hold on;
plot3(30000,60000,0,'ko')
text(30000+700,60000+700,0,'雷达2')
hold on;
plot3(55000,110000,0,'ko')
text(55000+700,110000+700,0,'雷达3')
hold on;
plot3(105000,110000,0,'ko')
text(105000+700,110000+700,0,'雷达4')
hold on;
plot3(130000,60000,0,'ko')
text(130000+700,60000+700,0,'雷达5')
hold on
max_text={'0','7980','7995'};
plot3([55000,x(1)],[110000,y(1)],[0,z(1)],'r-')
plot3([55000,x(2)],[110000,y(2)],[0,z(2)],'r-')
patch([55000,x(2),x(1)],[110000,y(2),y(1)],[0,z(2),z(1)],'r-')
grid on ;
hold on
 text(x(1),y(1),z(1),'第一个虚假点z=7995')
 plot3()
text([55000,x(2),x(1)]+1000,[110000,y(2),y(1)]+1000,[0,z(2),z(1)]+2,max_text)

% view(0,90)