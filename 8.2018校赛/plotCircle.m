%��Բ������x,yΪԲ�ģ�rΪ�뾶��cΪ��ɫ��
function [] = plotCircle(x,y,r,c)  
%     %������
    theta=0:0.1:2*pi; 
    Circle1=x+r*cos(theta);  
    Circle2=y+r*sin(theta);  
    %c=[123,14,52];  
    plot(Circle1,Circle2,c,'linewidth',1);  
    axis equal  
    
    
% ��Ƿ�     ��ɫ
% r               ��
% g              ��
% b              ��
% c              ����
% m            �Ϻ�
% y              ��
% k              ��
% w             ��


%����һ
% rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1),axis equal  

end 