function Y = asech(X)
%ASECH  Symbolic inverse hyperbolic secant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(asech(X.s));
else
    Y = mapcatch(inf,X,'asech');
end
