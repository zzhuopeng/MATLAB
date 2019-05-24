L=120;  %��
D=50;   %��Բ����ֱ��
d=2.5;  %ľ���
hL=L/2; %�볤
R=D/2;  %Բ����뾶
y=-R+d/2:d:R-d/2; %������ȷ�������λ��
x=sqrt(R^2-y.^2); %����������Բ�ϵ�λ��
H=hL-x(1);        %��ȳ��ȣ�Ҳ����������Ӹ߶�
 
Tx=R*cosd(0:3:360);Ty=R*sind(0:3:360);Tz=zeros(size(Tx)); %��������
legx=[hL*ones(size(x));x;nan(size(x))];                   %��������
legy=[y;y;nan(size(y))];
legz=[zeros(size(x));zeros(size(x));nan(size(x))];
legx=legx(:);legy=legy(:);legz=legz(:);
zhoux=[hL-H/2;hL-H/2];zhouy=[-R R];zhouz=[0;0];             %������
                           
figure(1),clf;
DEG=5:9:68;              %�Ƕ�����
for ii=1:8      %���������������۵��Ƕ�
    deg=DEG(ii);
    zz=-H/2*sind(deg);     %���������߶�
    xx=x(1)+H/2*cosd(deg); %�������
    alldeg=atan2(-zz*ones(size(x)),xx-x); %ÿ�������۵��Ƕ�
    allx=(hL-x).*cos(alldeg)+x;           %ÿ����ĩ��x����
    allz=-(hL-x).*sin(alldeg);            %ÿ����ĩ��z����
    legx=[allx;x;nan(size(x))];                 %��x����  
    legz=[allz;zeros(size(allz));nan(size(allz))];%t��z����
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