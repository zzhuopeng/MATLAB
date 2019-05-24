function Y = atanh(X)
%ATANH  Symbolic inverse hyperbolic tangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(atanh(X.s));
else
    Y = map(X,'atanh');
end
