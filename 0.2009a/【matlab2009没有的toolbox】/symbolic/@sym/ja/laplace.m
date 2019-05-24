%LAPLACE  ���v���X�ϊ�
%
%   L = LAPLACE(F) �́A�f�t�H���g�̓Ɨ��ϐ� t �����X�J���̃V���{���b�N
%   �I�u�W�F�N�g F �̃��v���X�ϊ��ł��B�f�t�H���g�̏o�͂́As �̊֐��ł��B
%   F = F(s) �̏ꍇ�ALAPLACE �� t �̊֐� L = L(t) ��Ԃ��܂��B
%   ��`�ɂ��AL(s) = int(F(t)*exp(-s*t),0,inf) �ŁAt �ɂ��Đϕ����܂��B
%
%   L = LAPLACE(F, t) �́A�f�t�H���g�� s �̑���ɁAt �̊֐� L ���v�Z���܂��B 
%   LAPLACE(F,t) <=> L(t) = int(F(x)*exp(-t*x),0,inf)
%
%   L = LAPLACE(F, w, z) �́A�f�t�H���g�� s �̑���ɁAz �̊֐� L ��
%   �v�Z���܂� (w �ɂ��Đϕ����܂�)�B
%   LAPLACE(F,w,z) <=> L(z) = int(F(w)*exp(-z*w),0,inf)
%
%   ��:
%      syms a s t w x
%      laplace(t^5) �� 120/s^6 ��Ԃ��܂��B
%      laplace(exp(a*s)) �� 1/(t-a) ��Ԃ��܂��B
%      laplace(sin(w*x),t) �� w/(t^2+w^2) ��Ԃ��܂��B
%      laplace(cos(x*w),w,t) �� t/(t^2+x^2) ��Ԃ��܂��B
%      laplace(x^sym(3/2),t) �� 3/4*pi^(1/2)/t^(5/2) ��Ԃ��܂��B
%      laplace(diff(sym('F(t)'))) �� laplace(F(t),t,s)*s-F(0) ��Ԃ��܂��B
%
%   �Q�l SYM/ILAPLACE, SYM/FOURIER, SYM/ZTRANS.


%   Copyright 1993-2008 The MathWorks, Inc.
