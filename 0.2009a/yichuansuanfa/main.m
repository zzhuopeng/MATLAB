% 2.8 ������
%�Ŵ��㷨������
%Name:genmain05.m
clear
clf
popsize=20; %Ⱥ���С
chromlength=10; %�ַ������ȣ����峤�ȣ�
pc=0.6; %�������
pm=0.001; %�������

pop=initpop(popsize,chromlength); %���������ʼȺ��
for i=1:20 %20Ϊ��������
[objvalue]=calobjvalue(pop); %����Ŀ�꺯��
fitvalue=calfitvalue(objvalue); %����Ⱥ����ÿ���������Ӧ��
[newpop]=selection(pop,fitvalue); %����
[newpop]=crossover(pop,pc); %����
[newpop]=mutation(pop,pc); %����
[bestindividual,bestfit]=best(pop,fitvalue); %���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
y(i)=max(bestfit);
n(i)=i;
pop5=bestindividual;
x(i)=decodechrom(pop5,1,chromlength)*10/1023;
pop=newpop;
end

% fplot('642084/3879400-x',[0 10])
% hold on
% plot(x,y,'r*')
% hold off

[z index]=max(y); %�������ֵ����λ��
x5=x(index) %�������ֵ��Ӧ��xֵ
y=z