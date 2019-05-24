clc;
clear;

load('cross_point.mat', 'cross_p');
[ N R T] = xlsread('append1');
x = N(:,2);y = N(:,3);z = N(:,4);

rada_location = zeros(5,3);
rada_location(1,:) = [80   0    0];
rada_location(2,:) = [30   60   0];
rada_location(3,:) = [55   110  0];
rada_location(4,:) = [105  110  0];
rada_location(5,:) = [130  60   0];
rada_location = rada_location .* 1000; %��λm


% �������������״�֮������ߣ���ֵ�⣩
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


% p1=[1,2]; p2=[3,4];%��֪������������ 
% syms b k
% [b,k]=solve(k*p1(1)-p1(2)+b,k*p2(1)-p2(2)+b);
% b = double(b);
% k = double(k);
% 
% [] = solve(y);

figure(1);
plot3(x,y,z,'b','linewidth',2);
text(rada_location(1,1),rada_location(1,2),rada_location(1,3),'�״�1','FontSize',12);
text(rada_location(2,1),rada_location(2,2),rada_location(2,3),'�״�2','FontSize',12);
text(rada_location(3,1),rada_location(3,2),rada_location(3,3),'�״�3','FontSize',12);
text(rada_location(4,1),rada_location(4,2),rada_location(4,3),'�״�4','FontSize',12);
text(rada_location(5,1),rada_location(5,2),rada_location(5,3),'�״�5','FontSize',12);
hold on
plot3(x,y,zeros(length(z)),'linewidth',2);
for n=1:5
   for i=1:20
       if n==1
           axy1 = plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'r','linewidth',1.5);
       end
        if n==2
           axy2 = plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'c','linewidth',1.5);
        end
        if n==3
            axy3 = plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'b','linewidth',1.5);
        end
        if n==4
            axy4 = plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'m','linewidth',1.5);
        end
       if n==5
           axy5 = plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'g','linewidth',1.5);
       end
%         % ��һ����ɫ
%         plot3([rada_location(n,1) x(i)],[rada_location(n,2) y(i)] ,[rada_location(n,3) z(i)] ,'b','linewidth',1.5);
       hold on
   end
end

legend([axy1,axy2,axy3,axy4,axy5],'�״�1','�״�2','�״�3','�״�4','�״�5')
caxy1 = patch([0,0,130000,130000],[110000,0,0,110000],[2000,2000,2000,2000],'r-','facealpha',0.5);
caxy2 = patch([0,0,130000,130000],[110000,0,0,110000],[2100,2100,2100,2100],'g-','facealpha',0.5);
caxy3 = patch([0,0,130000,130000],[110000,0,0,110000],[2200,2200,2200,2200],'m-','facealpha',0.5);
caxy4 = patch([0,0,130000,130000],[110000,0,0,110000],[2300,2300,2300,2300],'c-','facealpha',0.5);
caxy5 = patch([0,0,130000,130000],[110000,0,0,110000],[2400,2400,2400,2400],'y-','facealpha',0.5);
caxy6 = patch([0,0,130000,130000],[110000,0,0,110000],[2500,2500,2500,2500],'b-','facealpha',0.5);
%legend([caxy6,caxy5,caxy4,caxy3,caxy2,caxy1],'Z=2500m','Z=2400m','Z=2300m','Z=2200m','Z=2100m','Z=2000m')
% line(rada_location(1,:),[x y z])
% drawsphere(x1(27),y1(27),z1(27),0.5);
% drawsphere(x2(27),y2(27),z2(27),0.5);

% ���ƻ�վ�����⺽����ֱ�ߵ��ӳ���
VP = zeros(20, 3); %���⺽����
VP(:,1) = N(:,2);
VP(:,2) = N(:,3);
VP(:,3) = N(:,4);
RADIUS = zeros(1,20); %���⺽���� �����״�ľ��루��λkm��
VPExtence = zeros(20, 3); %���⺽���� �ӳ��� �˵�

for n=1:5 %����ÿһ���״�
    for i=1:20  %����ÿһ�����⺽����
        tempDis = distance( rada_location(n,:),  VP(i,:));
%         RADIUS(i) = tempDis - (5.5*(i-10)^2)+2000; %�����仯����(��λ������)�״�2
%         RADIUS(i) = tempDis + (3.5*(i-10)^2)+1300; %�����仯����(��λ������)�״�3
        RADIUS(i) = tempDis*1.2;
        VPExtence(i,3) = (RADIUS(i)/tempDis)*VP(i,3);
        [VPExtence(i,1), VPExtence(i,2)] = CalculateXYFromZ( rada_location(n,:), VP(i,:), VPExtence(i,3) );
        %�����״����ӳ��߶˵��ֱ��
        if n==1
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'r','linewidth',1.5);
        end
        if n==2
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'c','linewidth',1.5);
        end
        if n==3
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'b','linewidth',1.5);
        end
        if n==4
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'m','linewidth',1.5);
        end
        if n==5
            plot3([VP(i,1) VPExtence(i,1)], [VP(i,2) VPExtence(i,2)], [VP(i,3) VPExtence(i,3)] ,'g','linewidth',1.5);
        end
        hold on;
    end
end

%title('�޶��߶������˻����пռ�ʾ��ͼ');
title('�״�����ٺ�������ʾ��ͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');

%% 
grid on %minor

% axis([-inf inf -inf inf 0 10]);
figure(2)
face_1=cross_p(:,:,1);
xx=face_1( :, 1);
yy=face_1( : ,2);
zz=face_1( :,3);
plot(xx,yy ,'--*b','linewidth',1.5);
title('�״�1����ٺ�����������ĳ�߶ȵ�ͶӰ���άͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');


figure(3)
face_2=cross_p(:,:,2);
xx2=face_2( :, 1);
yy2=face_2( : ,2);
zz2=face_2( :,3);
plot(xx2,yy2 ,'--*r','linewidth',1.5);
title('�״�2����ٺ�����������ĳ�߶ȵ�ͶӰ���άͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');

figure(4)
face_3=cross_p(:,:,3);
xx3=face_3( :, 1);
yy3=face_3( : ,2);
zz3=face_3( :,3);
plot(xx3,yy3 ,'--*g','linewidth',1.5);
title('�״�3����ٺ�����������ĳ�߶ȵ�ͶӰ���άͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');

figure(5)
face_4=cross_p(:,:,4);
xx4=face_3( :, 1);
yy4=face_3( : ,2);
zz4=face_3( :,3);
plot(xx4,yy4,'--*b','linewidth',1.5);
title('�״�4����ٺ�����������ĳ�߶ȵ�ͶӰ���άͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');

figure(6)
face_5=cross_p(:,:,5);
xx5=face_5( :, 1);
yy5=face_5( : ,2);
zz5=face_5( :,3);
plot(xx5,yy5,'--*r','linewidth',1.5);
title('�״�5����ٺ�����������ĳ�߶ȵ�ͶӰ���άͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');

figure(7)
plot(x,y,'--*g','linewidth',1.5);
title('��ٺ������άͶӰͼ');
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');