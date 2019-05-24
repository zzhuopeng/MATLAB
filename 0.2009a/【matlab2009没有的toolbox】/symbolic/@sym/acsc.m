function Y = acsc(X)
%ACSC   Symbolic inverse cosecant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acsc(X.s));
else
    Y = mapcatch(inf,X,'acsc');
end
