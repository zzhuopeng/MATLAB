function Y = asec(X)
%ASEC   Symbolic inverse secant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(asec(X.s));
else
    Y = mapcatch(inf,X,'asec');
end
