function Y = heaviside(X)
%HEAVISIDE    Symbolic step function.
%    HEAVISIDE(X) is 0 for X < 0, 1 for X > 0, and NaN for X == 0.
%    HEAVISIDE(X) is not a function in the strict sense, but rather
%    a distribution with diff(heaviside(x)) = dirac(x).
%
%    See also SYM/DIRAC.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(heaviside(X.s));
else
    Y = map(X,'heaviside');
end
