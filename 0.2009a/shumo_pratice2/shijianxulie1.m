clc,clear
load sw.txt %原始数据以列向量的方式存放在纯文本文件中
load sea_year.txt %海平面高度年份
yt=sw; n=length(yt);
alpha=[0.6 0.5 0.8];m=length(alpha);
yhat(1,1:m)=(yt(1)+yt(2))/2;
for i=2:n
yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
yhat
plot(sea_year,yt,'-*',sea_year,yhat(1:n),'-O')
title('1995-2014年海平面高度“一次指数平滑法”预测');
xlabel('年份/year');ylabel('高度/mm');
legend('实际值','预测值',2)
err=sqrt(mean((repmat(yt,1,m)-yhat).^2))
%xlswrite('dianqi.xls',yhat)
s=yhat(:,1);
% for i=1:37
%     yt=alpha(1)*yt(n)+(1-alpha(1)).*yhat(n,1);
% end
% s(2020)
% s(2050)