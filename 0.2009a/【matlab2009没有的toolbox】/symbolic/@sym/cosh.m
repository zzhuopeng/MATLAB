function Y = cosh(X)
%COSH   Symbolic hyperbolic cosine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(cosh(X.s));
else
    Y = map(X,'cosh');
end
