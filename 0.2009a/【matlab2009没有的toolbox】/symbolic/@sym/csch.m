function Y = csch(X)
%CSCH   Symbolic hyperbolic cosecant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(csch(X.s));
else
    Y = mapcatch(inf,X,'csch');
end
