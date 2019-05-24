clc;
clear;
deltT = 10;
load('cross_point.mat', 'cross_p');
[ N R T] = xlsread('append1'); 
N = N/1000;
x = N(:,2);y = N(:,3);z = N(:,4);
% time = 0:deltT:200-deltT;
rada_location = zeros(5,3);
rada_location(1,:) = [80   0    0];
rada_location(2,:) = [30   60   0];
rada_location(3,:) = [55   110  0];
rada_location(4,:) = [105  110  0];
rada_location(5,:) = [130  60   0];


% 求虚拟坐标与雷达之间的连线（数值解）
% k = 0:0.01:1;
% p1 = rada_location(1,:);
% p2 = [x(1) y(1) z(1)];
% x1 = p1(1)+k*(p2(1)-p1(1));
% y1 = p1(2)+k*(p2(2)-p1(2));
% z1 = p1(3)+k*(p2(3)-p1(3));
% 
% k = 0:0.01:1;
% p1 = rada_location(2,:);
% p2 = [x(20) y(20) z(20)];
% x2 = p1(1)+k*(p2(1)-p1(1));
% y2 = p1(2)+k*(p2(2)-p1(2));
% z2 = p1(3)+k*(p2(3)-p1(3));
% 
% figure
% plot3(x1,y1,z1);


% p1=[1,2]; p2=[3,4];%已知的两个点坐标 
% syms b k
% [b,k]=solve(k*p1(1)-p1(2)+b,k*p2(1)-p2(2)+b);
% b = double(b);
% k = double(k);
% 
% [] = solve(y);


linewidth = 2;
figure(1)
plot3(x,y,z,'linewidth',linewidth);
text(80,0,0,'雷达1')
text(30,60,0,'雷达2')
text(55,110,0,'雷达3')
text(105,110,0,'雷达4')
text(130,60,0,'雷达5')
hold on
plot3(x,y,zeros(length(z)),'linewidth',linewidth);
for n=1:5
   for i=1:20
       plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'b','linewidth',1.5);
       hold on
   end
end
patch([0,0,130,130],[110,0,0,110],[2,2,2,2],'g-','facealpha',0.5)
patch([0,0,130,130],[110,0,0,110],[2.1,2.1,2.1,2.1],'r-','facealpha',0.5)
patch([0,0,130,130],[110,0,0,110],[2.2,2.2,2.2,2.2],'y-','facealpha',0.5)
patch([0,0,130,130],[110,0,0,110],[2.3,2.3,2.3,2.3],'b-','facealpha',0.5)
patch([0,0,130,130],[110,0,0,110],[2.4,2.4,2.4,2.4],'r-','facealpha',0.5)
patch([0,0,130,130],[110,0,0,110],[2.5,2.5,2.5,2.5],'b-','facealpha',0.5)
% line(rada_location(1,:),[x y z])
% drawsphere(x1(27),y1(27),z1(27),0.5);
% drawsphere(x2(27),y2(27),z2(27),0.5);

% 绘制基站到虚拟航迹点直线的延长线
VP = zeros(20, 3); %虚拟航迹点
VP(:,1) = N(:,2);
VP(:,2) = N(:,3);
VP(:,3) = N(:,4);
RADIUS = zeros(1,20); %虚拟航迹点 距离雷达的距离（单位km）
VPExtence = zeros(20, 3); %虚拟航迹点 延长线 端点

% for n=1:5 %遍历每一个雷达
    for i=1:20  %遍历每一个虚拟航迹点
        tempDis = distance( rada_location(3,:),  VP(i,:));
%         RADIUS(i) = tempDis - (5.5*(i-10)^2)/1000+2; %浮动变化函数(单位：公里)雷达2
        RADIUS(i) = tempDis + (3.5*(i-10)^2)/1000+1.3; %浮动变化函数(单位：公里)雷达3
        VPExtence(i,3) = (RADIUS(i)/tempDis)*VP(i,3);
        [VPExtence(i,1), VPExtence(i,2)] = CalculateXYFromZ( rada_location(3,:), VP(i,:), VPExtence(i,3) );
        %绘制雷达与延长线端点的直线
%         if n==1
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'r','linewidth',1);
%         end
%         if n==2
%             plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'c','linewidth',1);
%         end
%         if n==3
%             plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'b','linewidth',1);
%         end
%         if n==4
%             plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'k','linewidth',1);
%         end
%         if n==5
%             plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'y','linewidth',1);
%         end
%         hold on;
    end
% end

grid minor
xlabel('x');ylabel('y');zlabel('z');

axis([-inf inf -inf inf 0 10]);
figure(2)
face_1=cross_p(:,:,1);
xx=face_1( :, 1);
yy=face_1( : ,2) 
zz=face_1( :,3)
plot(xx,yy ,'--*b','linewidth',1.5);
figure(3)

face_2=cross_p(:,:,2);
xx2=face_2( :, 1);
yy2=face_2( : ,2) 
zz2=face_2( :,3)
plot(xx2,yy2 ,'--*r','linewidth',1.5);

figure(4)
face_3=cross_p(:,:,3);
xx3=face_3( :, 1);
yy3=face_3( : ,2)
zz3=face_3( :,3)
plot(xx3,yy3 ,'--*g','linewidth',1.5);

figure(5)
face_4=cross_p(:,:,4);
xx4=face_3( :, 1);
yy4=face_3( : ,2) 
zz4=face_3( :,3)
plot(xx4,yy4,'--*g','linewidth',1.5);

figure(6)
face_5=cross_p(:,:,5);
xx5=face_5( :, 1);
yy5=face_5( : ,2) 
zz5=face_5( :,3)
plot(xx5,yy5,'--*g','linewidth',1.5);
