%SYMSUM  �V���{���b�N�ȑ��a
%
%   SYMSUM(S) �́AFINDSYM �Ō��肳���悤�ȃV���{���b�N�ϐ��ɂ��āA
%   S �̖�����̑��a�����߂܂��B
%   SYMSUM(S, v) �́Av �ɂ��Ė�����̑��a�����߂܂��BSYMSUM(S, a, b) �� 
%   SYMSUM(S, v, a, b)�́Aa ���� b �܂ł̃V���{���b�N���̑��a�����߂܂��B
%
%   ��:
%      simple(symsum(k))             1/2*k*(k-1)
%      simple(symsum(k,0,n-1))       1/2*n*(n-1)
%      simple(symsum(k,0,n))         1/2*n*(n+1)
%      simple(symsum(k^2,0,n))       1/6*n*(n+1)*(2*n+1)
%      symsum(k^2,0,10)              385
%      symsum(k^2,11,10)             0
%      symsum(1/k^2)                 -Psi(1,k)
%      symsum(1/k^2,1,Inf)           1/6*pi^2
%
%   �Q�l SYM/INT.


%   Copyright 1993-2008 The MathWorks, Inc.
