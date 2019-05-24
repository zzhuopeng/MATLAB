function Y = sec(X)
%SEC    Symbolic secant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(sec(X.s));
else
    Y = mapcatch(inf,X,'sec');
end
