function Y = acosh(X)
%ACOSH  Symbolic inverse hyperbolic cosine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acosh(X.s));
else
    Y = map(X,'acosh');
end
