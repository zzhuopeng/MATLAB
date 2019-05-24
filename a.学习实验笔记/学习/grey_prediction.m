%��ɫԤ��ģ��GM��1��n��ģ�͵�matlabԴ���룬����Ԥ��ģ�͵Ľ������Լ�ģ�͵ľ��ȼ���ָ��c,p�ļ���
%����Ԥ��3����N=3
%��������ڼ��룺
%gm=ycgm1n([1.6,1.7,2,1.8,1.9,1.7,1.6,2],[2,2.4,3,3.2,3.1,3.4,3.1,3.3],[3,3.1,3.2,3.5,2.8,2.5,2.6,3],3)
function GM=grey_prediction(data1,data2,data3,N) %data1:��ҡ��data2:������data3:����
T=length(data1);  
PYX1=data1;
PYX2=data2;
PYX3=data3;
%��������Ԥ���������ó�ֵ��
X0_1=PYX1./PYX1(1);
X0_2=PYX2./PYX2(1);
X0_3=PYX3./PYX3(1);
%��AGO����һ���ۼ�����ģ��
X1_1(1)=X0_1(1);
X1_2(1)=X0_2(1);
X1_3(1)=X0_3(1);
for i=2:T  
   X1_1(i)=X1_1(i-1)+X0_1(i); 
   X1_2(i)=X1_2(i-1)+X0_2(i);
   X1_3(i)=X1_3(i-1)+X0_3(i);
end 
%�����ۼӾ���B
for i=1:T-1 
   M1(i)=(0.5*(X1_1(i)+X1_1(i+1)));
   M2(i)=(0.5*(X1_2(i)+X1_2(i+1)));
   M3(i)=(0.5*(X1_3(i)+X1_3(i+1)));
end 
 
B1=zeros(T-1,3); 
for i=1:(T-1) 
    B1(i,1)=-M1(i);   %-(X1_1(i)+X1_1(i+1)))/2; 
    B1(i,2)=X1_2(i+1); 
    B1(i,3)=X1_3(i+1);
end
B2=zeros(T-1,2); 
for i=1:(T-1) 
    B2(i,1)=-M2(i);   %-(X1_2(i)+X1_2(i+1)))/2; 
    B2(i,2)=X1_3(i+1); 
end
B3=zeros(T-1,2); 
for i=1:(T-1) 
    B3(i,1)=-M3(i);   %-(X1_3(i)+X1_3(i+1)))/2; 
    B3(i,2)=1; 
end
save B1 B1;
save B2 B2;
save B3 B3;
%���쳣��������Y
for i=2:T                          
    Y1(i-1)=X0_1(i); 
    Y2(i-1)=X0_2(i);
    Y3(i-1)=X0_3(i);
end 
HCS1=inv(B1'*B1)*B1'*Y1';               %����С���˷���Ҳ���HCS1 
H1=HCS1';                            %H1=[a,b2,b3]
HCS2=inv(B2'*B2)*B2'*Y2';               %����С���˷���Ҳ���HCS2 
H2=HCS2';                            %H2=[a,b3]
HCS3=inv(B3'*B3)*B3'*Y3';               %����С���˷���Ҳ���HCS3 
H3=HCS3';                            %H3=[b,a]

%�����X3���ۼ�����
for i=1:T+N                         
YCX13(i)=(X0_3(1)-H3(2)/H3(1))*exp(-1*H3(1)*(i-1))+H3(2)/H3(1); 
end 
for i=2:T+N                     
       % K(i)=XR1(i)-XR1(i-1); 
       YCX0_3(i)=YCX13(i)-YCX13(i-1);
end
YCX0_3(1)=X0_3(1);

%�Բ�����alpha��beta�任
H2=H2./(1+0.5*H2(1));
%��ԭ�����X2��Ԥ��ֵ
YCX0_2(1)=X0_2(1);
for i=2:T                     
       YCX0_2(i)=H2(2).*X1_3(i)-H2(1).*X1_2(i-1);
end
YCX12(T)=X1_2(T);
for i=T+1:T+N
    YCX0_2(i)=H2(2).*YCX13(i)-H2(1).*YCX12(i-1);
    YCX12(i)=YCX0_2(i)+YCX12(i-1);
end


%�Բ�����alpha��beta�任
H1=H1./(1+0.5*H1(1));
%��ԭ�����X1��Ԥ��ֵ
YCX0_1(1)=X0_1(1);
for i=2:T                     
       YCX0_1(i)=H1(2).*X1_2(i)+H1(3).*X1_3(i)-H1(1).*X1_1(i-1);
end
YCX11(T)=X1_1(T);
for i=T+1:T+N
    YCX0_1(i)=H1(2).*YCX12(i)+H1(3).*YCX13(i)-H1(1).*YCX11(i-1);
    YCX11(i)=YCX0_1(i)+YCX11(i-1);
end

%���ݻ�ԭ
GM=YCX0_1;  %.*PYX1(1);  
save GM GM; 
e0(1,T-1)=zeros;   
for i=1:T-1                      %��X1��X5�Ĳв�ֵe0                     
e0(i)=(X0_1(i+1)-YCX0_1(i+1))/X0_1(i+1); %1-YCX0_1(i+1)/X0_1(i+1);
end 
save e0 e0; 
e0_average=sum(abs(e0))/length(e0)
p=1-e0_average;


X_average=mean(X0_1)              %��ԭʼ����x0��ֵ 
s1=std(PYX1)                     %��ԭʼ���ݵı�׼�� 
s2=std(e0) 
c=s2/s1                          %���㷽���c,c<0.35Ϊ�� 
end
