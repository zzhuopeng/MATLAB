function B = transpose(A)
%TRANSPOSE Symbolic matrix transpose.
%   TRANSPOSE(A) overloads symbolic A.' .
%
%   Example: 
%      [a b; 1-i c].' returns [a 1-i; b c].
%
%   See also SYM/CTRANSPOSE.

%   Copyright 1993-2008 The MathWorks, Inc.

if ndims(A) > 2
   error('symbolic:sym:transpose:errmsg1','Transpose on ND array is not definied.')
elseif isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    B = sym(transpose(A.s));
else
    B = struct(A);
    B = class(B.','sym');
end
