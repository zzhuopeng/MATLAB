%M�����ļ�
function yy=user_function(beta,xx) 
x1=xx(:,2);
y=xx(:,3);
z=xx(:,4);
yy=(beta(1)+beta(2)*x1.^2+beta(3)*x1+beta(4)*y.^2+beta(5)*y+beta(6)*z.^2+beta(7)*z);
%�����ǵ���M�ļ���������
% x=[1 7776 10613 9 2.329227
%  1 7458 8920 36 1.900614
%  1 7405 10981 6 1.521699
%  1 6423 8831 40 1.214913
%  1 6395 10443 4 1.962908
%  1 5567 6782 7 2.354228
%  1 5438 3994 10 2.235376
%  1 5006 8846 6 2.159869
%  1 4948 7293 6 2.911263
%  1 4742 7293 9 3.085116];%Ԫ������
% xx=x(:,1:4);
% yy=x(:,5);
% beta=[9.38648061866336  -0.00402303999797   0.00000014548075    0.00068845595413 -0.00000005250534   0.02252737015359  -0.00108482795115];%��ֵ
% [beta,R,J]=nlinfit(xx,yy,@user_function,beta()); %���ϵ��
% betaci=nlparci(beta,R,J) %��������
