% ���
%-----------------------------------------------
% 2.1��ʼ��(����)
% initpop.m�����Ĺ�����ʵ��Ⱥ��ĳ�ʼ����popsize��ʾȺ��Ĵ�С��chromlength��ʾȾɫ��ĳ���(��ֵ���ĳ���)��
% ���ȴ�Сȡ���ڱ����Ķ����Ʊ���ĳ���(�ڱ�����ȡ10λ)��
%�Ŵ��㷨�ӳ���
%Name: initpop.m
%��ʼ��
function pop=initpop(popsize,chromlength) 
pop=round(rand(popsize,chromlength)); % rand�������ÿ����ԪΪ {0,1} ������Ϊpopsize������Ϊchromlength�ľ���
% round�Ծ����ÿ����Ԫ����Բ�������������ĳ�ʼ��Ⱥ��