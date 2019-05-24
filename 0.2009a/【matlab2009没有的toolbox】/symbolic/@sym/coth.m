function Y = coth(X)
%COTH   Symbolic hyperbolic cotangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(coth(X.s));
else
    Y = mapcatch(inf,X,'coth');
end
