%(1836.7/(2*pi*3.2*0.15*0.81))*(exp((-1/2)*(power(abs(50-50.37),2)/power(0.81,2)))+exp((-1/2)*(power(abs(50+50.37),2)/power(0.81,2))))

%% 点源扩散模型,计算目标点浓度。
v=3.2; %风速
%x=0.1:0.1:5000;  %距离
% x=-5000:1:5000
% y=x;
[x,y]=meshgrid(0:50:25000,-2000:50:2000); %设定网格，下风向排放点距离x米，烟气中心轴水平距离y米

z=50;       %烟囱高度
H=50.37;  %抬升高度
Q=1160*5700/3600; %污染排放率
alpha_1=0.888723;
gamma_1=0.146669;
alpha_2=0.55536;
gamma_2=0.810763;
% sigma_y=gamma_1*power(x,alpha_1);%横向扩散参数
% sigma_z=gamma_2*power(x,alpha_2);%纵向扩散参数

% C=zeros(1,50000);
% sigma_y=zeros(1,50000);
% sigma_z=zeros(1,50000);

% for i=1:1:50000
% %     sigma_y(i)=gamma_1*power(x(i),alpha_1);%横向扩散参数
% %     sigma_z(i)=gamma_2*power(x(i),alpha_2);%纵向扩散参数
% sigma_y(i)=(0.08*x(i))/power(1+0.0001*x(i),0.5);
% sigma_z(i)=(0.06*x(i))/power(1+0.0015*x(i),0.5);
%     %计算污染浓度（有高度z，只有y=0）
%     C(i)=1000*(Q/(2*pi*v*sigma_y(i)*sigma_z(i)))*(exp((-1/2)*(power(abs(z-H),2)/power(sigma_z(i),2)))+exp((-1/2)*(power(abs(z+H),2)/power(sigma_z(i),2))));
%      %    (1836.7/(2*pi*3.2*0.15*0.81))*(exp((-1/2)*(power(abs(50-50.37),2)/power(0.81,2)))+exp((-1/2)*(power(abs(50+50.37),2)/power(0.81,2))))
%     % 计算污染浓度(无高度z，即z=0)
%     %C=(Q/(pi*v*sigma_y*sigma_z))*exp(-power(H,2)/(2*power(sigma_z,2)));
% end
a=1000*(Q./(2*pi*v.*sigma_y.*sigma_z));
b=exp((-1/2)*((z-H).^2)./(sigma_z.^2));
c=exp((-1/2)*((z+H).^2)./(sigma_z.^2));
C=a.*(b+c);

mesh(x,y,C);
xlabel('x轴下风向距离(m)'),ylabel('y轴向距离(m)'),zlabel('气体扩散浓度'),


% %% 画图。
% [x,y]=meshgrid(x,y); %利用meshgrid函数生成X-Y平面的网格数据
% 
% surf(x,y,C);
