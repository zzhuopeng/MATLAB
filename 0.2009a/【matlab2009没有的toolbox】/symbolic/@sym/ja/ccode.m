%CCODE  �V���{���b�N���� C �R�[�h�\��
%
%   CCODE(S)�́A�V���{���b�N�� S ��]������ C �̃t���O�����g��Ԃ��܂��B
%
%   ��:
%      syms x
%      f = taylor(log(1+x));
%      ccode(f) =
%
%         t0 = x-x*x/2.0+x*x*x/3.0-x*x*x*x/4.0+x*x*x*x*x/5.0;
%
%      H = sym(hilb(3));
%      ccode(H) =
%
%         H[0][0] = 1.0;          H[0][1] = 1.0/2.0;      H[0][2] = 1.0/3.0;
%         H[1][0] = 1.0/2.0;      H[1][1] = 1.0/3.0;      H[1][2] = 1.0/4.0;
%         H[2][0] = 1.0/3.0;      H[2][1] = 1.0/4.0;      H[2][2] = 1.0/5.0;
%
%   �Q�l SYM/PRETTY, SYM/LATEX, SYM/FORTRAN.


%   Copyright 1993-2008 The MathWorks, Inc.
