clc;
clear;
deltT = 10;
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

linewidth = 2;
figure(1)
plot3(x,y,z,'linewidth',linewidth);
hold on
plot3(x,y,zeros(length(z)),'linewidth',linewidth);
for n=1:5
   for i=1:20
       plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'b','linewidth',1.5);
       hold on
   end
end

% line(rada_location(1,:),[x y z])
% drawsphere(x1(27),y1(27),z1(27),0.5);
% drawsphere(x2(27),y2(27),z2(27),0.5);

grid minor
xlabel('x');ylabel('y');zlabel('z');
axis([-inf inf -inf inf 0 10]);


