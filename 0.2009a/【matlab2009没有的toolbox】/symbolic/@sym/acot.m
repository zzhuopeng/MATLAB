function Y = acot(X)
%ACOT   Symbolic inverse cotangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acot(X.s));
else
    Y = map(X,'acot');
end
