L=120; %��
D=50; %����Բ����ֱ��
d=2.5; %ľ���
hL=L/2; %�볤
R=D/2; %Բ����뾶
y=-R+d/2:d:R-d/2; %�������ȷ�������λ��
x = (R - (abs(y)-R))/sqrt(3); %����������Բ�ϵ�λ������
H=hL-x(1); %��ȳ��ȣ�Ҳ����������Ӹ߶�
Tx=[x -x;x -x];Ty=[y-d/2 fliplr(y)+d/2;y+d/2 fliplr(y)-d/2]; %��������
Tx=Tx(:);Ty=Ty(:);Tz=zeros(size(Tx));
legx=[hL*ones(size(x));hL*ones(size(x));x;x]; %�������� 
legy=[y-d/2;y+d/2;y+d/2;y-d/2];
legz=zeros(size(legx)); 
zhoux=[hL-H/2;hL-H/2];zhouy=[-R R];zhouz=[0;0]; %������
figure(1),clf;
h1=patch(Tx,Ty,Tz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
h2= patch(legx,legy,legz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
h3=patch(-legx,legy,legz,'facecolor',[1 0.5 0],'edgecolor',[1 1 1]);
hold on
h4=plot3(zhoux,zhouy,zhouz,'b-.');
h5=plot3(-zhoux,zhouy,zhouz,'b-.');
hold off
view(3);
axis equal;
axis([-hL hL -R R 0 H]);
axis off;   
ddeg=2; %�Ƕ�����
for deg=0:ddeg:75 %���������������۵��Ƕ�
    zz=-H/2*sind(deg); %���������߶�
    xx=x(1)+H/2*cosd(deg); %�������
    alldeg=atan2(-zz*ones(size(x)),xx-x); %ÿ�������۵��Ƕ�
    allx=(hL-x).*cos(alldeg)+x; %ÿ����ĩ��x����
    allz=-(hL-x).*sin(alldeg); %ÿ����ĩ��z����
    minz=min(allz); %��Сz����
    legx=[allx;allx;x;x]; %��x���� 
    legz=[allz;allz;zeros(size(allz));zeros(size(allz))]-minz;%t��z����
    set(h1,'ZData',-minz*ones(size(Tz)));
    set(h2,'XData',legx,'ZData',legz);
    set(h3,'XData',-legx,'ZData',legz);
    set(h4,'XData',[xx;xx],'ZData',[zz;zz]-minz);
    set(h5,'XData',-[xx;xx],'ZData',[zz;zz]-minz);
    pause(0.1);
    drawnow;
end