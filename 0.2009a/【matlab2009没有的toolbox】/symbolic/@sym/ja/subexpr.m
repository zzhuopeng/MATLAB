%SUBEXPR  ���ʂ��镔�����ɂ�鎮�̏�������
%
%   [Y, SIGMA] = SUBEXPR(X, SIGMA)�A�܂��́A[Y, SIGMA] = SUBEXPR(X, 'SIGMA') 
%   �́A���ʂ��镔�����ɂ��V���{���b�N�� X �����������܂��B�����̕������́A
%   PRETTY(S) �ɂ��\���ł́A%1, %2 ���ŕ\�킳��܂��B
%
%   ��:
%      t = solve('a*x^3+b*x^2+c*x+d = 0');
%      [r,s] = subexpr(t,'s');
%
%   �Q�l SYM/PRETTY, SYM/SIMPLE, SYM/SUBS.


%   Copyright 1993-2008 The MathWorks, Inc.
