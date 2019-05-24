%ILAPLACE  �t���v���X�ϊ�
%
%   F = ILAPLACE(L) �́A�f�t�H���g�̓Ɨ��ϐ� s �����X�J���̃V���{���b�N
%   �I�u�W�F�N�g L �̋t���v���X�ϊ��ł��B�f�t�H���g�̏o�͂́At �̊֐��ł��B
%   L = L(t) �̏ꍇ�AILAPLACE �́Ax �̊֐� F = F(x) ��Ԃ��܂��B
%   ��`�ɂ��AF(t) = int(L(s)*exp, (s*t), s, c-i*inf, c+i*inf) �ŁA
%   �����ŁAc �͎����l�ŁAL(s) �̂��ׂĂ̓��ٓ_�����C�� s = c �̍�����
%   �Ȃ�悤�ɑI�����Ai = sqrt(-1) �ɂ����āA�ϕ��� s �ɂ��Čv�Z����܂��B
%
%   F = ILAPLACE(L, y)�́A�f�t�H���g�� t �̑���ɁAy �̊֐� F ���v�Z���܂��B
%       ILAPLACE(L,y) <=> F(y) = int(L(y)*exp(s*y),s,c-i*inf,c+i*inf)
%   �����ŁAy �̓X�J���̃V���{���b�N�I�u�W�F�N�g�ł��B
%
%   F = ILAPLACE(L, y, x) �́A�f�t�H���g�� t �̑���ɁAx �̊֐� F ���v�Z���A
%   y �ɂ��Đϕ����܂��B
%   ILAPLACE(L,y,x) <=> F(y) = int(L(y)*exp(x*y),y,c-i*inf,c+i*inf)
%
%   ��:
%      syms s t w x y
%      ilaplace(1/(s-1)) �� exp(t) ��Ԃ��܂��B
%      ilaplace(1/(t^2+1)) �� sin(x) ��Ԃ��܂��B
%      ilaplace(t^(-sym(5/2)),x) �� 4/3/pi^(1/2)*x^(3/2) ��Ԃ��܂��B
%      ilaplace(y/(y^2 + w^2),y,x) �� cos(w*x) ��Ԃ��܂��B
%      ilaplace(sym('laplace(F(x),x,s)'),s,x) �� F(x) ��Ԃ��܂��B
%
%   �Q�l SYM/LAPLACE, SYM/IFOURIER, SYM/IZTRANS.


%   Copyright 1993-2008 The MathWorks, Inc.
