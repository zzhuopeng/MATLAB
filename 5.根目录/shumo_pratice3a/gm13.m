function y=gm13(x0) %灰色系统计算程序 包含预测与估计
x1=cumsum(x0);
B=[-1/2*(x1(1)+x1(2)),-1/2*(x1(2)+x1(3)),-1/2*(x1(3)+x1(4));1,1,1]';
Y=[x0(2),x0(3),x0(4)]';
alf=inv(B'*B)*B'*Y;
a=alf(1);
b=alf(2);
y1=x0(1);
y2=(x0(1)-b/a)*(1-exp(a))*exp(-a*1);
y3=(x0(1)-b/a)*(1-exp(a))*exp(-a*2);
y4=(x0(1)-b/a)*(1-exp(a))*exp(-a*3);
y5=(x0(1)-b/a)*(1-exp(a))*exp(-a*4)
y=[y1,y2,y3,y4];
xx=sum(x0)/4;
s12=sum((x0-xx).^2)/4;
e0=x0-y;
ee=sum(e0)/4;
s22=sum((e0-ee).^2)/4;
c=sqrt(s22/s12)
k=0;
for i=1:4
    if abs(e0(i)-ee)<=0.6745*s12
        k=k+1;
    end
end
p=k/4
