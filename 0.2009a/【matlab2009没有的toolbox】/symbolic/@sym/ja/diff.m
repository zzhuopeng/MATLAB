%DIFF  ����
%
%   DIFF(S) �́AFINDSYM �Ō��肳���悤�Ȏ��R�ϐ��Ɋւ��āA�V���{���b�N�� 
%   S ��������܂��B
%   DIFF(S,'v')�A�܂��́ADIFF(S,sym('v')) �́Av �Ɋւ��� S ��������܂��B
%   DIFF(S,n) �́A���̐��� n �ɑ΂��āAS �� n ��������܂��B
%   DIFF(S,'v',n) �� DIFF(S,n,'v') �����p�ł��܂��B
%
%   ��;
%      x = sym('x');
%      t = sym('t');
%      diff(sin(x^2)) �� 2*cos(x^2)*x �ł��B
%      diff(t^6,6) �� 720 �ł��B
%
%   �Q�l SYM/INT, SYM/JACOBIAN, SYM/FINDSYM.


%   Copyright 1993-2008 The MathWorks, Inc.
