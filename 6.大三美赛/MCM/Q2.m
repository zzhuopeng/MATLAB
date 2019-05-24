% calculate Q2
close all;
clear all;
clc; %清除缓存

Alpha=0.6;%水的导热系数
beta=9.0;%水的蒸发系数
esl=0.97;
delta=0.000000056;
Theta=25;%环境温度
Pa=1013.25;
L=2500;
Cp=1.013;  
Pv2=23.36;
Pv=25.47;
F=2.64;

den=1;
Tin=50;%水输入温度
Cw=4.2;
T0=42;%水初始温度
V=1.176;%浴缸体积
syms Q T
%Q2=(beta*Pa)*(Cp*(T-Theta)+(0.623*L)*(Pv2-Pv)/Pa)*F+esl*delta*((T+273)^4-(42+273)^4)*F
ezplot((Cw.*den.*Q.*(Tin-T)-(beta.*Pa).*(Cp.*(T-Theta)+(0.623*L).*(Pv2-Pv)./Pa).*F+esl.*delta.*((T+273).^4-(42+273).^4).*F).*3600-(T-T0).*Cw.*den.*V) 
%ezplot((4.2*Q*(50-T)-(9119.25)*(1.013*(T-25)-3.2433506)*2.64+0.0000001434048*((T+273)^4-(42+273)^4))*3600-(T-42)*4.2*1*1.176)
grid on %添加网格线命令
