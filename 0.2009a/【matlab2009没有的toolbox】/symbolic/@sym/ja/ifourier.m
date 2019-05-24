%IFOURIER  �t�t�[���G�ϕ��ϊ�
%
%   f = IFOURIER(F) �́A�f�t�H���g�̓Ɨ��ϐ� w �����X�J���V���{�� F ��
%   �t�t�[���G�ϊ��ł��B�f�t�H���g�̖߂�l�� x �̊֐��ł��B�t�t�[���G�ϊ��́A
%   w �̊֐��ɓK�p����Ax �̊֐��A���Ȃ킿 F = F(w) => f = f(x) ��Ԃ��܂��B
%   F = F(x) �̏ꍇ�AIFOURIER �́At �̊֐��A���Ȃ킿 f = f(t) ��Ԃ��܂��B
%   ��`�ɂ��Af(x) = 1/(2*pi) * int(F(w)*exp(i*w*x),w,-inf,inf) �Ɛϕ��́A
%   w �Ɋւ��čs���܂��B
%
%   f = IFOURIER(F, u) �́A�f�t�H���g�� x �̑���ɁAu �̊֐� f ���쐬���܂��B
%   IFOURIER(F,u) <=> f(u) = 1/(2*pi) * int(F(w)*exp(i*w*u,w,-inf,inf)
%   �����ŁAu �́A�X�J���V���{�� (w �Ɋւ���ϕ�) �ł��B
%
%   f = IFOURIER(F, v, u) �́A�f�t�H���g w �̑���� v �̊֐�����\������� 
%   F ���g���܂��B  IFOURIER(F,v,u) <=>
%   f(u) = 1/(2*pi) * int(F(v)*exp(i*v*u,v,-inf,inf)
%   v �Ɋւ���ϕ��B
%
%   ��:
%    syms t u w x
%    ifourier(w*exp(-3*w)*sym('Heaviside(w)'))   ��   1/2/pi/(3-i*t)^2 
%    ��Ԃ��܂��B
%
%    ifourier(1/(1 + w^2),u) �́A�ȉ��̌��ʂ�Ԃ��܂��B
%         1/2*exp(-u)*Heaviside(u)+1/2*exp(u)*Heaviside(-u)
%
%    ifourier(v/(1 + w^2),v,u)   ��   i/(1+w^2)*Dirac(1,-u) ��Ԃ��܂��B
%
%    ifourier(sym('fourier(f(x),x,w)'),w,x)   ��   f(x) ��Ԃ��܂��B
%
%   �Q�l SYM/FOURIER, SYM/ILAPLACE, SYM/IZTRANS.


%   Copyright 1993-2008 The MathWorks, Inc.
