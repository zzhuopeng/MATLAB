clear;clc;
%% ʹ���Զ��庯��add(a,b)������ӡ��������
% result = add(1,1)
% result = add(2,2)

%% ���Զ��庯��add(a,b)��Ϊ��������������multiply(f,c)����
f=@add; %�൱�ڰ�add����Ϊһ��ָ��
result = multiply(f,2)

