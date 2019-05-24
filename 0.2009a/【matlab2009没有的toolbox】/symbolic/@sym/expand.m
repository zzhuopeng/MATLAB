function r = expand(s)
%EXPAND Symbolic expansion.
%   EXPAND(S) writes each element of a symbolic expression S as a
%   product of its factors.  EXPAND is most often used on polynomials,
%   but also expands trigonometric, exponential and logarithmic functions.
%
%   Examples:
%      expand((x+1)^3)   returns  x^3+3*x^2+3*x+1
%      expand(sin(x+y))  returns  sin(x)*cos(y)+cos(x)*sin(y)
%      expand(exp(x+y))  returns  exp(x)*exp(y)
%
%   See also SYM/SIMPLIFY, SYM/SIMPLE, SYM/FACTOR, SYM/COLLECT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(s)) && strcmp(class(s.s),'maplesym')
    r = sym(expand(s.s));
else
    r = reshape(map(s(:),'expand'),size(s));
end
