
%% ѵ��������

%��ʼ��
clc % ����
clear all; %����ڴ��Ա�ӿ������ٶ�
close all; %�رյ�ǰ���� figure ͼ��
SamNum=19; %������������Ϊ 19
TestSamNum=19; %������������Ҳ�� 19
ForcastSamNum=2; %Ԥ����������Ϊ 2
HiddenUnitNum=16; %�м�����ڵ�����ȡ 16
InDim=4; %��������ά��Ϊ 4
OutDim=1; %�������ά��Ϊ 1

% ԭʼ���ݣ�4�飩
%��������mm��
sqin=[63.28 46 63 50 49.4 69.25 75.26 51.6 44.56 35.5 58.73 53.05 43.32 74.04 44.13 44.77 34.79 42.48 60.37];
%���ʳ���(mm)
sqcj=1:19;
%��ƽ��߶�(mm)
sqgd=[52 53 54 55 60 51 56 61 68 55 44 76 48 75 91 64 93 153 115];
%GDP(��Ԫ)
sqgdp=[842 1048 1297 1535 1804 2187 2482 2970 3586 4282.14 4926.9 5813.56 6801.57 7786.79 8201.32 9581.51 11505.53 12950.06 14500.23];

%���ں�����ʧ(��Ԫ)
hzss=[14381.1 19209.6 8091 22185 8091 6185.7 5420.1 7290.6 12000 6203.1 24000 5884.5 2432.5 6272.7 7359.8 32581 11318.7 23272.5 27370.2];
p=[sqin;sqcj;sqgd;sqgdp]; %�������ݾ���
t=hzss; %Ŀ�����ݾ���
[SamIn,minp,maxp,tn,mint,maxt]=premnmx(p,t); %ԭʼ�����ԣ�������������ʼ��
rand('state',sum(100*clock)) %����ϵͳʱ�����Ӳ��������
NoiseVar=0.01; %����ǿ��Ϊ 0.01�����������Ŀ����Ϊ�˷�ֹ���������ϣ�
Noise=NoiseVar*randn(1,SamNum); %��������
SamOut=tn + Noise; %��������ӵ����������
TestSamIn=SamIn; %����ȡ�������������������ͬ��Ϊ��������ƫ��
TestSamOut=SamOut; %Ҳȡ������������������ͬ
MaxEpochs=50000; %���ѵ������Ϊ 50000
lr=0.035; %ѧϰ����Ϊ 0.035
E0=0.65*10^(-4); %Ŀ�����Ϊ 0.65*10^(-4)
W1=0.5*rand(HiddenUnitNum,InDim)-0.1; %��ʼ���������������֮���Ȩֵ
B1=0.5*rand(HiddenUnitNum,1)-0.1; %��ʼ���������������֮�����ֵ
W2=0.5*rand(OutDim,HiddenUnitNum)-0.1; %��ʼ���������������֮���Ȩֵ
B2=0.5*rand(OutDim,1)-0.1; %��ʼ���������������֮�����ֵ
ErrHistory=[]; %���м����Ԥ��ռ���ڴ�
for i=1:MaxEpochs
HiddenOut=logsig(W1*SamIn+repmat(B1,1,SamNum)); % �������������
NetworkOut=W2*HiddenOut+repmat(B2,1,SamNum); % ������������
Error=SamOut-NetworkOut; % ʵ��������������֮��
SSE=sumsqr(Error) %�������������ƽ���ͣ�
ErrHistory=[ErrHistory SSE];
if SSE<E0,break, end %����ﵽ���Ҫ��������ѧϰѭ��
% ���������� BP ��������ĵĳ���
% ������Ȩֵ����ֵ�����������������ݶ��½�ԭ��������ÿһ����̬������
Delta2=Error;
Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);
dW2=Delta2*HiddenOut';
dB2=Delta2*ones(SamNum,1);
dW1=Delta1*SamIn';
dB1=Delta1*ones(SamNum,1);
%���������������֮���Ȩֵ����ֵ��������
W2=W2+lr*dW2;
B2=B2+lr*dB2;
%���������������֮���Ȩֵ����ֵ��������
W1=W1+lr*dW1;
B1=B1+lr*dB1;
end
HiddenOut=logsig(W1*SamIn+repmat(B1,1,TestSamNum)); % ������������ս��
NetworkOut=W2*HiddenOut+repmat(B2,1,TestSamNum); % �����������ս��
a=postmnmx(NetworkOut,mint,maxt); % ��ԭ���������Ľ��
x=1995:2013; % ʱ����̶�
newh=a; % ������ʧ
figure ;
plot(x,newh,'r-o',x,hzss,'b--+') %��ֵ������ʧ�Ա�ͼ��
legend('�������������ʧ','ʵ�ʺ�����ʧ');
xlabel('���');ylabel('������ʧ/��Ԫ');

%% ����ѵ���õ��������Ԥ��
% ����ѵ���õ������������ pnew ����Ԥ��ʱ��ҲӦ����Ӧ�Ĵ���
pnew=[47.3203 35.678 %p=[sqin;sqcj;sqgd;sqgdp]; %�������ݾ���
26 56
172.9710 458.8590
19732 21477]; %2020 ��� 2050 ���������ݣ�
pnewn=tramnmx(pnew,minp,maxp); %����ԭʼ�������ݵĹ�һ�������������ݽ��й�һ����
HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % ���������Ԥ����
anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum); % ��������Ԥ����
%������Ԥ��õ������ݻ�ԭΪԭʼ����������
anew=postmnmx(anewn,mint,maxt)