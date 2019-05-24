%SVD  �V���{���b�N�ȓ��ْl����
%
%   �o�͈����� 1 �ݒ肵�� SIGMA = SVD(A) �́A�V���{���b�N�s�� A �̓��ْl��
%   �܂ރV���{���b�N�x�N�g���ł��BSIGMA = SVD(VPA(A)) �́A�ϐ��x�̉��Z��
%   �g���Đ��l�I�ȓ��ْl���v�Z���܂��B
%
%   �o�͈����� 3 �ݒ肵�� [U, S, V] = SVD(A) �� [U, S, V] = SVD(VPA(A)) ��
%   �e��ɓ��قȃx�N�g���������l�I�ȃ��j�^���s�� U �� V�A���ْl���܂ޑΊp�s�� 
%   S ��Ԃ��܂��B�����́AA = U*S*V' �𖞂����܂��B���قȃx�N�g���̌v�Z�́A
%   �ϐ��x�̉��Z���g���A���͍s��͐��l�łȂ���΂Ȃ�܂���B���قȃx�N�g����
%   �V���{���b�N�ɂ��邱�Ƃ͂ł��܂���B
%
%   ��:
%      A = sym(magic(4))
%      svd(A)
%      svd(vpa(A))
%      [U,S,V] = svd(A)
%
%      syms t real
%      A = [0 1; -1 0]
%      E = expm(t*A)
%      sigma = svd(E)
%      simplify(sigma)
%
%   �Q�l SVD, SYM/EIG, SYM/VPA.


%   Copyright 1993-2008 The MathWorks, Inc.
