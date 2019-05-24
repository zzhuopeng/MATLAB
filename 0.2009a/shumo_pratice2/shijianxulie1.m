clc,clear
load sw.txt %ԭʼ�������������ķ�ʽ����ڴ��ı��ļ���
load sea_year.txt %��ƽ��߶����
yt=sw; n=length(yt);
alpha=[0.6 0.5 0.8];m=length(alpha);
yhat(1,1:m)=(yt(1)+yt(2))/2;
for i=2:n
yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
yhat
plot(sea_year,yt,'-*',sea_year,yhat(1:n),'-O')
title('1995-2014�꺣ƽ��߶ȡ�һ��ָ��ƽ������Ԥ��');
xlabel('���/year');ylabel('�߶�/mm');
legend('ʵ��ֵ','Ԥ��ֵ',2)
err=sqrt(mean((repmat(yt,1,m)-yhat).^2))
%xlswrite('dianqi.xls',yhat)
s=yhat(:,1);
% for i=1:37
%     yt=alpha(1)*yt(n)+(1-alpha(1)).*yhat(n,1);
% end
% s(2020)
% s(2050)