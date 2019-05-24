function r = rref(A)
%RREF   Reduced row echelon form.
%   RREF(A) is the reduced row echelon form of the symbolic matrix A.
%
%   Example:
%       rref(sym(magic(4))) is not the identity.

%   Copyright 1993-2008 The MathWorks, Inc.

if all(size(A) == 1)
   r = sym(A ~= 0);
elseif isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    r = sym(rref(A.s));
else
   r = mupadfeval('mlgaussJordan',A);
end;

