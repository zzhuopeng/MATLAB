%COEFFS  ���ϐ��������̌W��
%
%   C = COEFFS(P) �́AP �̂��ׂĂ̕s��������Ɋւ��鑽���� P �̌W����Ԃ��܂��B
%   C = COEFFS(P,X) �́AX �Ɋւ��鑽���� P �̌W����Ԃ��܂��B
%   [C,T] = COEFFS(P,...) �́AP �̍��̎�����Ԃ��܂��B�W���� P �̍��̊Ԃ� 
%   1 �� 1 �ň�v���܂��B
%
%   ��:
%      syms x
%      t = 2 + (3 + 4*log(x))^2 - 5*log(x);
%      coeffs(expand(t)) = [ 11, 19, 16]
%
%      syms a b c x
%      y = a + b*sin(x) + c*sin(2*x)
%      coeffs(y,sin(x)) = [a+c*sin(2*x), b]
%      coeffs(expand(y),sin(x)) = [a, b+2*c*cos(x)]
%
%      syms x y
%      z = 3*x^2*y^2 + 5*x*y^3
%      coeffs(z) = [3, 5]
%      coeffs(z,x) = [5*y^3, 3*y^2]
%      [c,t] = coeffs(z,y) returns c = [3*x^2, 5*x], t = [y^2, y^3]
%
%   �Q�l SYM/SYM2POLY.


%   Copyright 1993-2008 The MathWorks, Inc.
