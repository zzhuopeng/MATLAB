function Y = acsch(X)
%ACSCH  Symbolic inverse hyperbolic cosecant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acsch(X.s));
else
    Y = mapcatch(inf,X,'acsch');
end
