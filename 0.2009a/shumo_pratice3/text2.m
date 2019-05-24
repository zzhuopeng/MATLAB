clear all;
[x,y]=meshgrid(0:50:25000,-2000:50:2000); %�趨�����·����ŷŵ����x�ף�����������ˮƽ����y��
Q=1160*5700/3600;%Դǿ���ͷ��ٶ�
sigy=0.11*x./(1+0.0001*x).^0.5;%ˮƽ��ɢϵ��(�ɲ����֪��
sigz=0.08*x./(1+0.0002*x).^0.5;%��ֱ��ɢϵ��(�ɲ����֪��
u=3.24;%����
He=65;
z=0;%�߶�
 
Qpi=2*Q./(2*pi*u.*sigy.*sigz+eps);%���㹫ʽ��һ����
ex1=exp(-0.5*(y./(sigy+eps)).^2);%���㹫ʽ�ڶ�����
ex2=exp(-0.5*((z-He)./(sigz+eps)).^2)+exp(-0.5*((z+He)./(sigz+eps)).^2);%���㹫ʽ��������
C=Qpi.*ex1.*ex2;%������ɢ����Ũ��
 
mesh(x,y,C);
xlabel('x���·������(m)'),ylabel('y�������(m)'),zlabel('������ɢŨ��'),

[Cmax,I]=max(C(:));%����c�����ֵ��Cmax�������õ��±�
xmax=x(I);%�����±�õ�x�����ֵ��xmax��