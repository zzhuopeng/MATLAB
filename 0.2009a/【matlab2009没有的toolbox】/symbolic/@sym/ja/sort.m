%SORT  �V���{���b�N�ȃx�N�g���A���邢�͑������̕��בւ�
%
%   Y = SORT(V) �́A�V���{���b�N�x�N�g���̗v�f V �𐔒l�I�ɁA���邢��
%   �������̏����ɕ��בւ��܂��B
%   Y = SORT(P) �́A������ P �̍����~���ɕ��בւ��܂��B
%
%   ��:
%      syms a b c d e x
%      sort(sym(magic(3))) = [1,2,3,4,5,6,7,8,9]
%      sort([a c e b d]) = [a b c d e]
%      sort([a c e b d]*x.^(0:4).') =
%         d*x^4 + b*x^3 + e*x^2 + c*x + a
%
%   �Q�l SYM/SYM2POLY, SYM/COEFFS.


%   Copyright 1993-2008 The MathWorks, Inc.
