function C = mod(A,B)
%MOD    Symbolic matrix element-wise mod.
%   C = MOD(A,B) for symbolic matrices A and B with integer elements
%   is the positive remainder in the element-wise division of A by B.  
%   For matrices A with polynomial entries, MOD(A,B) is applied to the
%   individual coefficients.
%
%   Examples:
%      ten = sym('10');
%      mod(2^ten,ten^3)
%      24
%
%      syms x
%      mod(x^3-2*x+999,10)
%      x^3+8*x+9
%
%   See also SYM/QUOREM.

%   Copyright 1993-2008 The MathWorks, Inc.

A = sym(A);
B = sym(B);
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    C = sym(mod(A.s,B.s));
elseif all(size(B) == 1)
   C = map(A,'mlmodp',B);
elseif all(size(A) == 1)
   C = mapn(2,B,'mlmodp',A);
elseif isequal(size(A),size(B));
   C = A;
   for k = 1:numel(A)
      C(k) = mupadfeval('mlmodp',A(k),B(k));
   end
else
   error('symbolic:sym:mod:errmsg1','Array dimensions must agree.')
end
