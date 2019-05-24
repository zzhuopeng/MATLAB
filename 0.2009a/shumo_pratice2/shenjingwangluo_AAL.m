%“神经网络算法”预测深圳市AAL
clc % 清屏
clear all; %清除内存以便加快运算速度
close all; %关闭当前所有 figure 图像
SamNum=20; %输入样本数量为 20
TestSamNum=20; %测试样本数量也是 20
ForcastSamNum=2; %预测样本数量为 2
HiddenUnitNum=8; %中间层隐节点数量取 16
InDim=4; %网络输入维度为 4
OutDim=1; %网络输出维度为 1
%原始数据
%降雨量（mm)
sqin=[63.28 63.28 46 63 50 49.4 69.25 75.26 51.6 44.56 35.5 58.73 53.05 43.32 74.04 44.13 44.77 34.79 42.48 60.37];
%地质沉降(mm)
sqcj=1:20;
%海平面高度(mm)
sqgd=[52 53	54 55 60 51 56 61 68 55 44 76 48 75 91 64 93 153 115 105];
%GDP(亿元)
sqgdp=[842.4833	1048.4421	1297.4208	1534.7272	1804.0176	2187.4515	2482.4874	2969.5184	3585.7235	4282.1428	4950.9078	5813.5624	6801.5706	7786.792	8201.3176	9581.5101	11505.5298	12950.0601	14500.2302	16001.98];
%深圳洪灾损失(万元)
hzss=[14381.1	19209.6	8091	22185	8091	6185.7	5420.1	7290.6	12000	6203.1	24000	5884.5	2432.5	6272.7	7359.8	32581	11318.7	23272.5	27370.2	13693.8];
p=[sqin;sqcj;sqgd;sqgdp]; %输入数据矩阵
t=hzss; %目标数据矩阵
[SamIn,minp,maxp,tn,mint,maxt]=premnmx(p,t); %原始样本对（输入和输出）初始化
rand('state',sum(100*clock)) %依据系统时钟种子产生随机数
NoiseVar=0.01; %噪声强度为 0.01（添加噪声的目的是为了防止网络过度拟合）
Noise=NoiseVar*randn(1,SamNum); %生成噪声
SamOut=tn + Noise; %将噪声添加到输出样本上
TestSamIn=SamIn; %这里取输入样本与测试样本相同因为样本容量偏少
TestSamOut=SamOut; %也取输出样本与测试样本相同
MaxEpochs=50000; %最多训练次数为 50000
lr=0.035; %学习速率为 0.035
E0=0.65*10^(-4); %目标误差为 0.65*10^(-4)
W1=0.5*rand(HiddenUnitNum,InDim)-0.1; %初始化输入层与隐含层之间的权值
B1=0.5*rand(HiddenUnitNum,1)-0.1; %初始化输入层与隐含层之间的阈值
W2=0.5*rand(OutDim,HiddenUnitNum)-0.1; %初始化输出层与隐含层之间的权值
B2=0.5*rand(OutDim,1)-0.1; %初始化输出层与隐含层之间的阈值
ErrHistory=[]; %给中间变量预先占据内存
for i=1:MaxEpochs
HiddenOut=logsig(W1*SamIn+repmat(B1,1,SamNum)); % 隐含层网络输出
NetworkOut=W2*HiddenOut+repmat(B2,1,SamNum); % 输出层网络输出
Error=SamOut-NetworkOut; % 实际输出与网络输出之差
SSE=sumsqr(Error) %能量函数（误差平方和）
ErrHistory=[ErrHistory SSE];
if SSE<E0,break, end %如果达到误差要求则跳出学习循环
% 以下六行是 BP 网络最核心的程序
% 他们是权值（阈值）依据能量函数负梯度下降原理所作的每一步动态调整量
Delta2=Error;
Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);
dW2=Delta2*HiddenOut';
dB2=Delta2*ones(SamNum,1);
dW1=Delta1*SamIn';
dB1=Delta1*ones(SamNum,1);
%对输出层与隐含层之间的权值和阈值进行修正
W2=W2+lr*dW2;
B2=B2+lr*dB2;
%对输入层与隐含层之间的权值和阈值进行修正
W1=W1+lr*dW1;
B1=B1+lr*dB1;
end
HiddenOut=logsig(W1*SamIn+repmat(B1,1,TestSamNum)); % 隐含层输出最终结果
NetworkOut=W2*HiddenOut+repmat(B2,1,TestSamNum); % 输出层输出最终结果
a=postmnmx(NetworkOut,mint,maxt); % 还原网络输出层的结果
x=1995:2014; % 时间轴刻度
newh=a; % 洪灾损失
figure;
plot(x,hzss,'r-*',x,newh,'b--o') %绘值洪灾损失对比图；
title('深圳洪灾损失量“神经网络”预测图');
legend('实际洪灾损失','预测洪灾损失',2);
xlabel('年份/year');ylabel('AAL/万元');

% 利用训练好的网络进行预测
% 当用训练好的网络对新数据 pnew 进行预测时，也应作相应的处理
pnew=[54.1800 78.8050  %2020年和2050年降雨量
26 56                              %2020年和2050年地质沉降
134.78 262.65                 %2020年和2050年海平面高度
28595 136100]; %2020 年和 2050 年的GDP；

pnewn=tramnmx(pnew,minp,maxp); %利用原始输入数据的归一化参数对新数据进行归一化；
HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % 隐含层输出预测结果
anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum); % 输出层输出预测结果
%把网络预测得到的数据还原为原始的数量级;
anew=postmnmx(anewn,mint,maxt)