%ZTRANS  Z-�ϊ�
%
%   F = ZTRANS(f) �́A�f�t�H���g�̓Ɨ��ϐ� n �Ɋւ���X�J���̃V���{���b�N�� 
%   f �� z-�ϊ��ł��B�f�t�H���g�̏o�͂́Az �̊֐� f = f(n) => F = F(z) �ł��B
%   f �� Z-�ϊ��́A���̂悤�ɒ�`����܂��B
%      F(z) = symsum(f(n)/z^n, n, 0, inf),
%   �����ŁAn �́AFINDSYM �Ō��肳���悤�� f �̃V���{���b�N�ϐ��ł��B
%   f = f(z) �̏ꍇ�AZTRANS(f) �́Aw �̊֐� F = F(w) ��Ԃ��܂��B
%
%   F = ZTRANS(f, w) �́A�f�t�H���g�� z �̑���ɁAw �̊֐� F ��Ԃ��܂��B  
%   ZTRANS(f,w) <=> F(w) = symsum(f(n)/w^n, n, 0, inf)
%
%   F = ZTRANS(f, k, w) �́A�V���{���b�N�ϐ� k �̊֐� f ��ϊ����܂��B 
%   ZTRANS(f,k,w) <=> F(w) = symsum(f(k)/w^k, k, 0, inf)
%
%   ��:
%      syms k n w z
%      ztrans(2^n)           �� z/(z-2) ��Ԃ��܂��B
%      ztrans(sin(k*n),w)    �� sin(k)*w/(1-2*w*cos(k)+w^2) ��Ԃ��܂��B
%      ztrans(cos(n*k),k,z)  �� z*(-cos(n)+z)/(-2*z*cos(n)+z^2+1) ��Ԃ��܂��B
%      ztrans(cos(n*k),n,w)  �� w*(-cos(k)+w)/(-2*w*cos(k)+w^2+1) ��Ԃ��܂��B
%      ztrans(sym('f(n+1)')) �� z*ztrans(f(n),n,z)-f(0)*z ��Ԃ��܂��B
%
%   �Q�l SYM/IZTRANS, SYM/LAPLACE, SYM/FOURIER.


%   Copyright 1993-2008 The MathWorks, Inc.
