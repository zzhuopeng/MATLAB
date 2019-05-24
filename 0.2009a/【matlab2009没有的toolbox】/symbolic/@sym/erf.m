function Y = erf(X)
%ERF    Symbolic error function.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(erf(X.s));
else
    Y = map(X,'erf');
end
