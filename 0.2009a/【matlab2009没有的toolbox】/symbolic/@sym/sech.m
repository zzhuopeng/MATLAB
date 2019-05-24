function Y = sech(X)
%SECH   Symbolic hyperbolic secant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(sech(X.s));
else
    Y = map(X,'sech');
end
