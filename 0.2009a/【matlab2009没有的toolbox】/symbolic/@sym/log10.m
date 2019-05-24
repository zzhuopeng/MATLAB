function Y = log10(X)
%LOG10  Symbolic matrix element-wise common logarithm.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym');
    Y = sym(log10(X.s));
else
    Y = mapcatch(-inf,X,'log');
    Y = Y/log(sym(10));
end
