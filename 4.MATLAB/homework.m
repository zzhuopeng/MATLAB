t=[70
65
60
55
50
45
40
35
30
25
24
23
21
20
];
y=[1.13
1.07
1.02
0.96
0.91
0.85
0.80
0.74
0.69
0.63
0.62
0.60
0.59
0.58
];

% plot(t,y,'--or');
% title('ʵ�ʲ���ͼ��');
% xlabel('T / ^oC');
% ylabel('U_0_2 / V');
% grid on

%��С���˷�
% p=polyfit(t,y,2)
% x1=20:5:70;
% y1=polyval(p,x1);
% plot(x1,y1,'-*b');
% title('��С���˷����ͼ��');
% xlabel('T / ^oC');
% ylabel('U_0_2 / V');
% grid on

% �Ƚ�����ͼ��
p=polyfit(t,y,2)
x1=20:5:70;
y1=polyval(p,x1);
plot(t,y,'--or',x1,y1,'-*b');
title('�Ƚ�ͼ��');
xlabel('T / ^oC');
ylabel('U_0_2 / V');
grid on
