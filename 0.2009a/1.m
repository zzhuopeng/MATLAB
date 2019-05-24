L=120;  %长
D=50;   %宽，圆桌面直径
d=2.5;  %木板宽
hL=L/2; %半长
R=D/2;  %圆桌面半径
y=-R+d/2:d:R-d/2; %长条宽度方向中心位置
x=sqrt(R^2-y.^2); %长条中心在圆上的位置
H=hL-x(1);        %最长腿长度，也就是最大桌子高度
 
Tx=R*cosd(0:3:360);Ty=R*sind(0:3:360);Tz=zeros(size(Tx)); %桌面数据
legx=[hL*ones(size(x));x;nan(size(x))];                   %桌腿数据
legy=[y;y;nan(size(y))];
legz=[zeros(size(x));zeros(size(x));nan(size(x))];
legx=legx(:);legy=legy(:);legz=legz(:);
zhoux=[hL-H/2;hL-H/2];zhouy=[-R R];zhouz=[0;0];             %轴数据
                           
figure(1),clf;
DEG=5:9:68;              %角度增量
for ii=1:8      %最长条桌腿相对桌面折叠角度
    deg=DEG(ii);
    zz=-H/2*sind(deg);     %轴相对桌面高度
    xx=x(1)+H/2*cosd(deg); %轴横坐标
    alldeg=atan2(-zz*ones(size(x)),xx-x); %每个条腿折叠角度
    allx=(hL-x).*cos(alldeg)+x;           %每条腿末端x坐标
    allz=-(hL-x).*sin(alldeg);            %每条腿末端z坐标
    legx=[allx;x;nan(size(x))];                 %腿x数据  
    legz=[allz;zeros(size(allz));nan(size(allz))];%t腿z数据
    legx=legx(:);legz=legz(:);
    zhoux=[xx;xx];zhouz=[zz;zz];
    subplot(4,2,ii),
    h1=plot3(Tx,Ty,Tz,'k');hold on
    h2=plot3(legx,legy,legz,'b');
    h3=plot3(-legx,legy,legz,'g');
    h4=plot3(zhoux,zhouy,zhouz,'r');
    h5=plot3(-zhoux,zhouy,zhouz,'r');
    hold off
    view(3);
    axis equal;
    xlabel('X');ylabel('Y');zlabel('Z');
end