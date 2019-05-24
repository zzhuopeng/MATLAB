function Y = round(X)
%ROUND  Symbolic matrix element-wise round.
%   Y = ROUND(X) rounds the elements of X to the nearest integers.
%   Values halfway between two integers are rounded away from zero.
%   Example:
%      x = sym(-5/2)
%      [fix(x) floor(x) round(x) ceil(x) frac(x)]
%      = [ -2, -3, -3, -2, -1/2]
%
%   See also SYM/FLOOR, SYM/CEIL, SYM/FIX, SYM/FRAC.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(round(X.s));
else
    Y = map(X,'mlround');
end
