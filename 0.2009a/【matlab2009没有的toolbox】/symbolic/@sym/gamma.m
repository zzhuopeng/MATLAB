function Y = gamma(X)
%GAMMA  Symbolic gamma function.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(gamma(X.s));
else
    Y = mapcatch(inf,X,'gamma');
end

