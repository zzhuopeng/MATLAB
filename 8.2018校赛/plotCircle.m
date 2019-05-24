%画圆函数（x,y为圆心；r为半径；c为颜色）
function [] = plotCircle(x,y,r,c)  
%     %方法二
    theta=0:0.1:2*pi; 
    Circle1=x+r*cos(theta);  
    Circle2=y+r*sin(theta);  
    %c=[123,14,52];  
    plot(Circle1,Circle2,c,'linewidth',1);  
    axis equal  
    
    
% 标记符     颜色
% r               红
% g              绿
% b              蓝
% c              蓝绿
% m            紫红
% y              黄
% k              黑
% w             白


%方法一
% rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1),axis equal  

end 