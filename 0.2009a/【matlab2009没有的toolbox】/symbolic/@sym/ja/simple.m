%SIMPLE  �V���{���b�N���܂��͍s��̍ł��V���v���ȃt�H�[���̌���
%
%   SIMPLE(S) �́AS �̂��ꂼ��ɈقȂ�㐔�I�Ȋȗ��������s���A�ǂ̂悤�� 
%   S �̕\���̒�����Z����������\�����Ȃ���A�ł��Z���\����Ԃ��܂��B
%   S �̓V���{���b�N�I�u�W�F�N�g�ł��BS ���s��̏ꍇ�A���ʂ͍s��S�̂�
%   �ł��Z���Ȃ�\���ł��B�X�̗v�f���ł��Z���Ƃ͌���܂���B
%
%   [R,HOW] = SIMPLE(S) �́A�ȗ����̓r�����ʂ�\�����܂��񂪁A�ł��Z��
%   �\���Ƌ��ɁA����̊ȗ����̕��@�����������񂪓����܂��B
%   R �̓V���{���b�N���ł��BHOW �͕�����ł��B
%
%   ��:
%
%      S                          R                  How
%
%      cos(x)^2+sin(x)^2          1                  simplify
%      2*cos(x)^2-sin(x)^2        3*cos(x)^2-1       simplify
%      cos(x)^2-sin(x)^2          cos(2*x)           combine(trig)
%      cos(x)+(-sin(x)^2)^(1/2)   cos(x)+i*sin(x)    radsimp
%      cos(x)+i*sin(x)            exp(i*x)           convert(exp)
%      (x+1)*x*(x-1)              x^3-x              combine(trig)
%      x^3+3*x^2+3*x+1            (x+1)^3            factor
%      cos(3*acos(x))             4*x^3-3*x          expand
%
%      syms x y positive
%      log(x) + log(y)            log(x*y)           combine
%
%   �Q�l SYM/SIMPLIFY, SYM/FACTOR, SYM/EXPAND, SYM/COLLECT.


%   Copyright 1993-2008 The MathWorks, Inc.
