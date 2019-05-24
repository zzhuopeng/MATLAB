% Symbolic Math Toolbox
% Version 5.1 (R2008b) 04-Aug-2008
%
% �v�Z
%   diff        - ����
%   int         - �ϕ�
%   limit       - �Ɍ��l
%   taylor      - Taylor����
%   jacobian    - ���R�r�s��
%   symsum      - �����̑��a
%
% ���`�㐔
%   diag        - �Ίp�s��̍쐬�A�܂��́A�Ίp�����̒��o
%   triu        - ��O�p�s��
%   tril        - ���O�p�s��
%   inv         - �t�s��
%   det         - �s��
%   rank        - �����N
%   rref        - �s��̊Ȗ�
%   null        - �k����Ԃɑ΂�����
%   colspace    - ���Ԃɑ΂�����
%   eig         - �ŗL�l�ƌŗL�x�N�g��
%   svd         - ���ْl�Ɠ��كx�N�g��
%   jordan      - Jordan�����^
%   poly        - ����������
%   expm        - �s��w��
%   mldivide    - \  �s��̍����Z
%   mpower      - ^  �s��ׂ̂���
%   mrdivide    - /  �s��̏��Z
%   mtimes      - *  �s��̏�Z
%   transpose   - .' �s��̓]�u
%   ctranspose  - '  �s��̕��f����]�u
%
% �ȗ���
%   simplify    - �ȗ���
%   expand      - �W�J
%   factor      - ��������
%   collect     - �W�����܂Ƃ߂�
%   simple      - �ł��Z���\���̌���
%   numden      - ���q�ƕ���
%   horner      - ����q�̑������\��
%   subexpr     - ���ʂ��镔�����ɂ�鎮�̏�������
%   coeffs      - ���ϐ��������̌W�����o
%   sort        - �V���{���b�N�x�N�g�����邢�͑������̃\�[�g
%   subs        - �V���{���b�N�ȑ��
%
% �������̉�@
%   solve       - �㐔�������̃V���{���b�N�ȉ�
%   dsolve      - �����������̃V���{���b�N�ȉ�
%   finverse    - �t�֐�
%   compose     - �֐��̍���
%
% �ϐ��x�̉��Z
%   vpa         - �ϐ��x�̉��Z
%   digits      - �ϐ��x�̐ݒ�
%
% �ϕ��ϊ�
%   fourier     - �t�[���G�ϊ�
%   laplace     - ���v���X�ϊ�
%   ztrans      - Z-�ϊ�
%   ifourier    - �t�t�[���G�ϊ�
%   ilaplace    - �t���v���X�ϊ�
%   iztrans     - �tZ-�ϊ�
%
% �ϊ�
%   double      - �V���{���b�N�s���{���x�ɕϊ�
%   single      - �V���{���b�N�s���P���x�ɕϊ�
%   poly2sym    - �W���x�N�g�����V���{���b�N�������ɕϊ�
%   sym2poly    - �V���{���b�N���������W���x�N�g���ɕϊ�
%   char        - �V���{���b�N�I�u�W�F�N�g�𕶎���ɕϊ�
%   int8        - �����t��8�r�b�g�����ɕϊ�
%   int16       - �����t��16�r�b�g�����ɕϊ�
%   int32       - �����t��32�r�b�g�����ɕϊ�
%   int64       - �����t��64�r�b�g�����ɕϊ�
%   uint8       - �����Ȃ�8�r�b�g�����ɕϊ�
%   uint16      - �����Ȃ�16�r�b�g�����ɕϊ�
%   uint32      - �����Ȃ�32�r�b�g�����ɕϊ�
%   uint64      - �����Ȃ�64�r�b�g�����ɕϊ�
%
% ��{���Z
%   sym         - �V���{���b�N�I�u�W�F�N�g�̍쐬
%   syms        - �V���{���b�N�I�u�W�F�N�g�쐬�̃V���[�g�J�b�g
%   findsym     - �V���{���b�N�ϐ��̌���
%   pretty      - �V���{���b�N���̃v���e�B�v�����g
%   latex       - �V���{���b�N����LaTeX�\��
%   texlabel    - �����񂩂�Produces the TeX�t�H�[�}�b�g�̍쐬
%   ccode       - �V���{���b�N����C�R�[�h�\��
%   fortran     - �V���{���b�N����Fortran�\��
%
% ���w����ё㐔�̉��Z
%   plus        - +  ���Z
%   minus       - -  ���Z
%   uminus      - -  negation.
%   times       - .* �z��̏�Z
%   ldivide     - \  �����Z
%   rdivide     - /  ���Z
%   power       - .^ �z��ׂ̂���
%   abs         - ��Βl
%   ceil        - �؂�グ (Ceiling)
%   conj        - ����
%   colon       - �R�������Z�q
%   fix         - ������
%   floor       - �؂�̂� (Floor)
%   frac        - ������
%   mod         - ��]
%   round       - �ۂ�
%   quorem      - ���Ɨ]��
%   imag        - ������
%   real        - ������
%   exp         - �w��
%   log         - ���R�ΐ�
%   log10       - ��p�ΐ�
%   log2        - 2���Ƃ����ΐ�
%   sqrt        - ������
%   prod        - �v�f�̐�
%   sum         - �v�f�̘a
%
% �_�����Z�q
%   isreal      - �����z��̌��o
%   eq          - ����
%   ne          - �s����
%
% ����֐�
%   besseli     - Bessel�֐� I
%   besselj     - Bessel�֐� J
%   besselk     - Bessel�֐� K
%   bessely     - Bessel�֐� Y
%   erf         - Error�֐�
%   sinint      - �����ϕ��֐�
%   cosint      - �]���ϕ��֐�
%   zeta        - Riemann��zeta�֐�
%   gamma       - �V���{���b�Ngamma�֐�
%   gcd         - �ő����
%   lcm         - �ŏ����{��
%   hypergeom   - ��ʒ��􉽊֐�
%   lambertw    - Lambert��W�֐�
%   dirac       - Delta�֐�
%   heaviside   - Step�֐�
%
% �O�p�֐�
%
%   acos        - �t�]��
%   acosh       - �t�o�Ȑ��]��
%   acot        - �t����
%   acoth       - �t�o�Ȑ�����
%   acsc        - �t�]��
%   acsch       - �t�o�Ȑ��]��
%   asec        - �t����
%   asech       - �t�o�Ȑ�����
%   asin        - �t����
%   asinh       - �t�o�Ȑ�����
%   atan        - �t����
%   atanh       - �t�o�Ȑ�����
%   cos         - �]��
%   cosh        - �o�Ȑ��]��
%   cot         - �]��
%   coth        - �o�Ȑ��]��
%   csc         - �]��
%   csch        - �o�Ȑ��]��
%   sec         - ����
%   sech        - �o�Ȑ�����
%   sin         - ����
%   sinh        - �o�Ȑ�����
%   tan         - ����
%   tanh        - �o�Ȑ�����
%
% ������̎�舵���̃��[�e�B���e�B
%   isvarname   - �L���ȕϐ����̃`�F�b�N(MATLAB TOOLBOX)
%   vectorize   - �V���{���b�N���̃x�N�g����
%   disp        - sym ��text�Ƃ��ĕ\��
%   display     - �֐���syms �Ƃ��ĕ\��
%   eval        - �V���{���b�N�\���̕]��
%
% ����I�ȃO���t�B�J���A�v���P�[�V����
%   rsums       - Riemann�a
%   ezcontour   - �ȒP�ȃR���^�[�v���b�g
%   ezcontourf  - �ȒP�ȓh��Ԃ��R���^�[�v���b�g
%   ezmesh      - �ȒP�ȃ��b�V��(�T�[�t�F�X)�v���b�g
%   ezmeshc     - ���b�V���ƃR���^�[�̊ȒP�ȑg�ݍ��킹�v���b�g
%   ezplot      - �֐��̊ȒP�ȃv���b�g
%   ezplot3     - 3�����p�����g���b�N�Ȑ��̊ȒP�ȃv���b�g
%   ezpolar     - �ȒP�ȋɍ��W�v���b�g
%   ezsurf      - �ȒP�ȃT�[�t�F�X�v���b�g
%   ezsurfc     - �T�[�t�F�X�ƃR���^�[�̊ȒP�ȑg�ݍ��킹�v���b�g
%   funtool     - �֐��v�Z�@
%   taylortool  - Taylor�����v�Z�@
%
% �f��
%   symintro    - Symbolic Toolbox�̏Љ�
%   symcalcdemo - �v�Z�̃f�����X�g���[�V����
%   symlindemo  - �V���{���b�N�Ȑ��`�㐔�̃f��
%   symvpademo  - �ϐ��x�̉��Z�̃f��
%   symrotdemo  - ���ʉ�]�̖��
%   symeqndemo  - �V���{���b�N�Ȏ��̉�@�̃f��
%
% Maple �ւ̃A�N�Z�X
%   maple       - Maple �̃J�[�l���ւ̃A�N�Z�X (Student Version �ł͎g�p�ł��܂���)
%   mfun        - Maple �֐��̐��l�]�� (Student Version �ł͎g�p�ł��܂���)
%   mfunlist    - MFUN �̊֐��̃��X�g ('help mfunlist' �Ɠ���)
%   mhelp       - Maple�̃w���v (Student Version �ł͎g�p�ł��܂���)
%   procread    - Maple �̃v���V�[�W���̑}�� (Extended Toolbox ���K�v�ł�)

%   Copyright 1993-2008 The MathWorks, Inc. 
