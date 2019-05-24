function [n,d] = numden(s)
%NUMDEN Numerator and denominator of a symbolic expression.
%   [N,D] = NUMDEN(A) converts each element of A to a rational 
%   form where the numerator and denominator are relatively prime 
%   polynomials with integer coefficients. 
%
%   Examples: 
%      [n,d] = numden(sym(4/5)) returns n = 4 and d = 5.
%      [n,d] = numden(x/y + y/x) returns
%         n = x^2+y^2 , d = y*x

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(s)) && strcmp(class(s.s),'maplesym');
    [n,d] = numden(s.s);
    n = sym(n); d = sym(d);
else
    n = map(s,'numer');
    d = map(s,'denom');
end
