% SUBS   �V���{���b�N�ȑ���B���𐔒l�I�ɕ]������Ƃ����g�p�ł��܂��B
%
% SUBS(S)�́A�V���{���b�N�� S ���̂��ׂĂ̕ϐ����A�Ăяo���֐��A�܂��́A
% MATLAB �̃��[�N�X�y�[�X���瓾����l�Œu�������܂��B
%   
% SUBS(S, NEW) �́AS ���̃V���{���b�N�Ȏ��R�ϐ��� NEW �Œu�������܂��B
% SUBS(S, OLD, NEW)�́A�V���{���b�N�� S ���� OLD �� NEW �Œu�������܂��B
% OLD �́A�V���{���b�N�ϐ��A�ϐ�����\�킷������A�R�[�e�[�V�����ň͂܂�
% ��������\���ł��BNEW �́A�V���{���b�N�ϐ��A�܂��́A���l�I�ȕϐ����邢
% �͎��ł��B�����ŁASUBS(S, OLD, NEW) �́AOLD = NEW �ŁAS �ŕ]�����܂��B
% 
% OLD �� NEW �������T�C�Y�̃x�N�g���A�܂��̓Z���z��̏ꍇ�AOLD �̊e�v�f�́A
% NEW �̑Ή�����v�f�ŁA�u���������܂��BS �� OLD ���X�J���ŁANEW ���A
% �x�N�g���A�܂��̓Z���z��̏ꍇ�A�z��̌��ʂ𐶐����邽�߂ɃX�J����
% �g�����܂��BNEW �����l�s�񂩂�Ȃ�Z���z��̏ꍇ�A�v�f���̑����
% ���s����܂� (A �� B �� DOUBLE �^�̂Ƃ��Asubs(x*y,{x,y},{A,B}) �́A
% A.*B ���o�͂��܂�)�BS �� N �̃V���{���b�N�ϐ� x1, x2, ..., xN �̎��ŁA
% Y1, Y2 ,..., YN �� DOUBLE �^�̍s��̏ꍇ�A
% subs(S, {x1,x2,...,xN}, {Y1,Y2,...YN}) �́ADOUBLE �^�̌��ʂ��o�͂��܂��B
%
% SUBS(S, OLD, NEW) �ɂ�� S ���ύX����Ȃ��ꍇ�ASUBS(S, NEW, OLD) ��
% �����Ă��������B����́A�O�o�[�W�����ɑ΂���݊�����񋟂��܂��B
% ����ɂ��A�����̏������o����K�v�͂���܂���BS ���ύX����Ȃ���΁A
% SUBS(S, OLD, NEW, 0) �́A�����̓���ւ����s���܂���B
%
% ��:
%     �P����:
%       ���[�N�X�y�[�X���� a = 980 �� C1 = 3 �����݂���Ɖ��肵�܂��B
%       �X�e�[�g�����g
%          y = dsolve('Dy = -a*y')
%       �́A���̌��ʂ��o�͂��܂��B
%          y = exp(-a*t)*C1
%       �X�e�[�g�����g
%          subs(y)
%       �́A���̌��ʂ��o�͂��܂��B
%          ans = 3*exp(-980*t)
%
%     1�ϐ��̑��:
%       subs(a+b,a,4) �́A4+b ���o�͂��܂��B
%
%     ���ϐ��̑��:
%       subs(cos(a)+sin(b),{a,b},[sym('alpha'),2]) �܂���
%       subs(cos(a)+sin(b),{a,b},{sym('alpha'),2}) �́A
%       cos(alpha)+sin(2) ���o�͂��܂��B
%   
%     �X�J���g���̏ꍇ: 
%       subs(exp(a*t),'a',-magic(2)) �́A���̌��ʂ��o�͂��܂��B
%
%       [   exp(-t), exp(-3*t)]
%       [ exp(-4*t), exp(-2*t)]
%
%     �����̃X�J���g���̏ꍇ:
%       subs(x*y,{x,y},{[0 1;-1 0],[1 -1;-2 1]}) �́A���̌��ʂ��o�͂��܂��B
%         0  -1
%         2   0
%
% �Q�l   SUBEXPR


%   Copyright 1993-2006 The MathWorks, Inc.
