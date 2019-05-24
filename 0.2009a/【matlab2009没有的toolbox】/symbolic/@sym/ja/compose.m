%COMPOSE  �֐��̍���
%
%   COMPOSE(f,g) �́Af(g(y)) ��Ԃ��܂��B�����ŁAf = f(x) �� g = g(y) �ł��B
%   x �� FINDSYM �Œ�`�����悤�� f �̃V���{���b�N�ϐ��ŁAy �� FINDSYM ��
%   ��`�����悤�� g �̃V���{���b�N�ϐ��ł��B
%
%   COMPOSE(f,g,z) �� f(g(z)) ��Ԃ��܂��B�����ŁAf = f(x) �� g = g(y) �ł��B
%   x �� y �́AFINDSYM �Œ�`�����悤�� f �� g �̃V���{���b�N�ϐ��ł��B
%
%   COMPOSE(f,g,x,z) �́Af(g(z)) ��Ԃ��Ax �� f �ɑ΂���Ɨ��ϐ��Ƃ��܂��B
%   ���Ȃ킿�Af = cos(x/t) �Ȃ�΁ACOMPOSE(f,g,x,z) �́Acos(g(z)/t) ��Ԃ��܂��B
%   ����ACOMPOSE(f,g,t,z) �́Acos(x/g(z)) ��Ԃ��܂��B
%
%   COMPOSE(f,g,x,y,z) �́Af(g(z)) ��Ԃ��Ax �� y �����ꂼ�� f �� g ��
%   �΂���Ɨ��ϐ��Ƃ��܂��B
%   f = cos(x/t) �� g = sin(y/u) �ɑ΂��āACOMPOSE(f,g,x,y,z) �́A
%   cos(sin(z/u)/t) ��Ԃ��A����ACOMPOSE(f,g,x,u,z) �́Acos(sin(y/z)/t) ��
%   �Ԃ��܂��B
%
%   ��:
%    syms x y z t u;
%    f = 1/(1 + x^2); g = sin(y); h = x^t; p = exp(-y/u);
%    compose(f,g)         returns   1/(1+sin(y)^2)
%    compose(f,g,t)       returns   1/(1+sin(t)^2)
%    compose(h,g,x,z)     returns   sin(z)^t
%    compose(h,g,t,z)     returns   x^sin(z)
%    compose(h,p,x,y,z)   returns   exp(-z/u)^t
%    compose(h,p,t,u,z)   returns   x^exp(-y/z)
%
%   �Q�l SYM/FINVERSE, SYM/FINDSYM, SYM/SUBS.


%   Copyright 1993-2008 The MathWorks, Inc.
