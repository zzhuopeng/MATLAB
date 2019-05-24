function Y = fix(X)
%FIX    Symbolic matrix element-wise integer part.
%   Y = FIX(X) is the matrix of the integer parts of X.
%   FIX(X) = FLOOR(X) if X is positive and CEIL(X) if X is negative.
%
%   See also SYM/ROUND, SYM/CEIL, SYM/FLOOR, SYM/FRAC.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(fix(X.s));
else
    Y = map(X,'fix');
end
