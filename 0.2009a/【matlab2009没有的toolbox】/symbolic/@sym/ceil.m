function Y = ceil(X)
%CEIL   Symbolic matrix element-wise ceiling.
%   Y = CEIL(X) is the matrix of the smallest integers >= X.
%   Example:
%      x = sym(-5/2)
%      [fix(x) floor(x) round(x) ceil(x) frac(x)]
%      = [ -2, -3, -3, -2, -1/2]
%
%   See also SYM/ROUND, SYM/FLOOR, SYM/FIX, SYM/FRAC.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(ceil(X.s));
else
    Y = map(X,'ceil');
end

