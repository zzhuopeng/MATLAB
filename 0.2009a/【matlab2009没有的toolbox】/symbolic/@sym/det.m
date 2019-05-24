function d = det(A)
%DET    Symbolic matrix determinant.
%   DET(A) is the determinant of the symbolic matrix A.
%
%   Examples:
%       det([a b;c d]) is a*d-b*c.

%   Copyright 1993-2008 The MathWorks, Inc.

if all(size(A) == 1)
    d = A;
elseif isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    d = sym(det(A.s));
else
    d = mupadfeval('det',A);
end;

