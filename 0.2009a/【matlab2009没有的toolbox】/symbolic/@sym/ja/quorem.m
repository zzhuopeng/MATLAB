%QUOREM  �V���{���b�N�s��̗v�f�P�ʂ̏��Ɨ]��
%
%   �����A�܂��͑������̗v�f�����V���{���b�N�s�� A �� B �ɑ΂��āA
%   [Q,R] = QUOREM(A,B) �́AA = Q.*B+R �ƂȂ�悤�� B �ɂ�� A �̗v�f
%   �P�ʂ̏��Z���s���A�� Q �Ɨ]�� R ��Ԃ��܂��B
%   ������ QUOREM(A,B,x) �ɑ΂��āAfindsym(A,1) ���邢�� findsym(B,1) ��
%   ����ɕϐ� x ���g���܂��B
%
%   ��:
%      syms x
%      p = x^3-2*x+5
%      [q,r] = quorem(x^5,p)
%         q = x^2+2
%         r = -5*x^2-10+4*x
%      [q,r] = quorem(10^5,subs(p,'10'))
%         q = 101
%         r = 515
%
%   �Q�l SYM/MOD, SYM/RDIVIDE, SYM/LDIVIDE.


%   Copyright 1993-2008 The MathWorks, Inc.
