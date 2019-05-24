%TAYLOR  �e�C���[�����W�J
%
%   TAYLOR(f) �́Af �ɑ΂��� 5 ���� Maclaurin �������ߎ��ł��B
%   3 �̃p�����[�^��C�ӂ̏����ŗ^���邱�Ƃ��ł��܂��B
%   TAYLOR(f, n) �́A(n-1) ���� Maclaurin �������ł��B
%   TAYLOR(f, a) �́A�_ a �Ɋւ���e�C���[�������ߎ������߂܂��B
%   TAYLOR(f, x) �́AFINDSYM(f) �̑���ɓƗ��ϐ� x ���g���܂��B
%
%   ��:
%      taylor(exp(-x))   �́A�ȉ���Ԃ��܂��B
%         1-x+1/2*x^2-1/6*x^3+1/24*x^4-1/120*x^5
%      taylor(log(x),6,1)   �́A�ȉ���Ԃ��܂��B
%         x-1-1/2*(x-1)^2+1/3*(x-1)^3-1/4*(x-1)^4+1/5*(x-1)^5
%      taylor(sin(x),pi/2,6)   �́A�ȉ���Ԃ��܂��B
%         1-1/2*(x-1/2*pi)^2+1/24*(x-1/2*pi)^4
%      taylor(x^t,3,t)   �́A�ȉ���Ԃ��܂��B
%         1+log(x)*t+1/2*log(x)^2*t^2
%
%   �Q�l SYM/FINDSYM, SYM/SYMSUM.


%   Copyright 1993-2008 The MathWorks, Inc.
