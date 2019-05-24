%% 无迭代重心法求中心点
% a=xlsread('zhongxinData.xlsx',1, 'C1:C4');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D4');
% x=xlsread('zhongxinData.xlsx',1, 'A1:A4');
% y=xlsread('zhongxinData.xlsx',1, 'B1:B4');
% m = a.*w;
% n = sum(m);
% c(1) = x*m'/n;
% c(2) = y*m'/n;
% figure,hold on;
% scatter(x,y,50,'filled') % 站点
% scatter(c(1),c(2),100,'filled') % 重心




%% 迭代案例
% %迭代公式       x(k+1)=(sum(r*w*xi)/di(k))/(sum(r*w*xi));
% %              y(k+1)=(sum(r*w*yi)/di(k))/(sum(r*w*xi));
% %              di(k+1)=sqrt((x(k)-xi)^2+(y(k)-yi)^2);
% r=0.8;
% w=[6398014.98,6525900.99,3752178.53,1400985.31,2495271.42,1506266.52,1953408.82];xi=[117.00,118.05,117.13,116.29,115.97,118.03,118.49]; yi=[36.65,36.78,36.18,37.45,36.45,37.36,37.46]; n=0;W=0.01  % W 为x，y的迭代精度假设为0.01
% x0=117.34;y0=36.75; %初值 
% while (1)
%     di=sqrt((x0-xi).^2+(y0-yi).^2);
%     x=(sum(r*w.*xi./di))./(sum(r.*w.*xi))
%     y=(sum(r*w.*yi./di))./(sum(r.*w.*xi))
%     if abs(x-x0)>W && abs(y-y0)>W  %若不满足迭代终止条件则继续迭代
%         x0=x;y0=y;n=n+1;
%         continue;
%     else
%         disp('迭代次数为：')
%         n
%         disp('x的迭代值为：');
%         x
%         
%         break;  %满足后输出结果并退出
%     end
% end
% %问题还是有些不清楚的,sum那个地方,我改了一下,不知道是你要表达的意思



%% 迭代重心法
function T=TotalCost
x0=0;
y0=0;
x1=0;
y1=0;
a=[0.04,0.04,0.095,0.095,0.095];
w=[5000,7000,3500,3000,5500];
% a=xlsread('zhongxinData.xlsx',1, 'C1:C5');
% w=xlsread('zhongxinData.xlsx',1, 'D1:D5');
x=[3,8,2,6,8];
y=[8,2,5,4,8];
d=[0,0,0,0,0];
T0=200;
T1=100;

while(T1-T0<=0)                                              
    T0=0;
    T1=0;
    a1=0;
    a2=0;
    b1=0;
    b2=0;
    x0=x1;
    y0=y1;
    for i=1:5
        d(i)=sqrt((x0-x(i))^2+(y0-y(i))^2);
        T0=T0+a(i)*w(i)*d(i);
    end

    for i=1:5
        a1=a1+a(i)*w(i)*x(i)/d(i);
        a2=a2+a(i)*w(i)/d(i);
        b1=b1+a(i)*w(i)*y(i)/d(i);
        b2=b2+a(i)*w(i)/d(i);
    end
    
    x1=a1/a2;
    y1=b1/b2;
    
    for i=1:5
       d(i)=sqrt((x(i)-x1)^2+(y(i)-y1)^2);
       T1=T1+a(i)*w(i)*d(i);
    end
    
    T0
    T1
end
x1
y1
figure,hold on;
scatter(x,y,50,'filled') % 站点
scatter(x1,y1,100,'filled') % 重心

