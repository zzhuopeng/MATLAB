function X = mrdivide(B, A)
%MRDIVIDE Symbolic matrix right division.
%   MRDIVIDE(B,A) overloads symbolic B / A.
%   X = B/A solves the symbolic linear equations X*A = B.
%   Warning messages are produced if X does not exist or is not unique.  
%   Rectangular matrices A are allowed, but the equations must be
%   consistent; a least squares solution is not computed.
%
%   See also SYM/MLDIVIDE, SYM/RDIVIDE, SYM/LDIVIDE, SYM/QUOREM.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    X = sym(mrdivide(B.s,A.s));
elseif all(size(A) == 1)
   % Division by a scalar.
   X = rdivide(B,A);

elseif ndims(A) > 2 || ndims(B) > 2
   error('symbolic:sym:mrdivide:errmsg1','Input arguments must be 2-D.')

elseif size(A,2) ~= size(B,2)
   error('symbolic:sym:mrdivide:errmsg2','Second dimensions must agree.')

else
   % Matrix divided by matrix
   X = (A.'\B.').';
end
