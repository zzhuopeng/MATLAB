function Y = acoth(X)
%ACOTH  Symbolic inverse hyperbolic cotangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acoth(X.s));
else
    Y = mapcatch(inf,X,'acoth');
end
