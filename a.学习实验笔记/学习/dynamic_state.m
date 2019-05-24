% %动态绘制椭圆
% clf;axis([-2,2,-2,2]);
% axis equal;
% pause(1);
% h=line(NaN,NaN,'marker','o','linesty','-','erasemode','none');
% t=6*pi*(0:0.02:1);
% for n=1:length(t)
% set(h,'xdata',2*cos(t(1:n)),'ydata',sin(t(1:n)));
% pause(0.05);%暂停0.05秒
% end
% 
% %No.2
% %貌似函数comet,comet3可以实现质点动画
% %comet(xdata,ydata,p) p为彗星尾巴长度，可为常数
% %平抛运动
% vx=40;
% t=linspace(0,10,1000);
% x=vx*t;
% y=-9.8*t.^2/2;
% comet(x,y)

%动态桌子
L=120;  %长
D=50;   %宽，圆桌面直径
d=2.5;  %木板宽
hL=L/2; %半长
R=D/2;  %圆桌面半径
y=-R+d/2:d:R-d/2; %长条宽度方向中心位置
x=sqrt(R^2-y.^2); %长条中心在圆上的位置
H=hL-x(1);        %最长腿长度，也就是最大桌子高度
  
Tx=[x -x;x -x];Ty=[y-d/2 fliplr(y)+d/2;y+d/2 fliplr(y)-d/2]; %桌面数据
Tx=Tx(:);Ty=Ty(:);Tz=zeros(size(Tx));
legx=[hL*ones(size(x));hL*ones(size(x));x;x];             %桌腿数据     
legy=[y-d/2;y+d/2;y+d/2;y-d/2];
legz=zeros(size(legx)); 
zhoux=[hL-H/2;hL-H/2];zhouy=[-R R];zhouz=[0;0];             %轴数据
                            
figure(1),clf;
h1=patch(Tx,Ty,Tz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
h2=patch(legx,legy,legz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
h3=patch(-legx,legy,legz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
hold on
h4=plot3(zhoux,zhouy,zhouz,'k-.');
h5=plot3(-zhoux,zhouy,zhouz,'k-.');
hold off
view(3);
axis equal;
axis([-hL hL -R R 0 H]);
axis off;
ddeg=2;                    %角度增量
f=getframe(gcf);  
imind=frame2im(f);
[imind,cm] = rgb2ind(imind,256);
imwrite(imind,cm,'1.gif','gif', 'Loopcount',inf,'DelayTime',0.1);
for deg=0:ddeg:75          %最长条桌腿相对桌面折叠角度
    zz=-H/2*sind(deg);     %轴相对桌面高度
    xx=x(1)+H/2*cosd(deg); %轴横坐标
    alldeg=atan2(-zz*ones(size(x)),xx-x); %每个条腿折叠角度
    allx=(hL-x).*cos(alldeg)+x;           %每条腿末端x坐标
    allz=-(hL-x).*sin(alldeg);            %每条腿末端z坐标
    minz=min(allz);                       %最小z坐标
    legx=[allx;allx;x;x];                 %腿x数据  
    legz=[allz;allz;zeros(size(allz));zeros(size(allz))]-minz;%t腿z数据
    set(h1,'ZData',-minz*ones(size(Tz)));
    set(h2,'XData',legx,'ZData',legz);
    set(h3,'XData',-legx,'ZData',legz);
    set(h4,'XData',[xx;xx],'ZData',[zz;zz]-minz);
    set(h5,'XData',-[xx;xx],'ZData',[zz;zz]-minz);
    pause(0.1);
    drawnow;
    f=getframe(gcf);  
    imind=frame2im(f);
    [imind,cm] = rgb2ind(imind,256);
    imwrite(imind,cm,'1.gif','gif','WriteMode','append','DelayTime',0.1);
end