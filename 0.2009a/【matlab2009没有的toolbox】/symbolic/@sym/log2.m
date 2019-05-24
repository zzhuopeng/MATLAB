function Y = log2(X)
%LOG2   Symbolic matrix element-wise base-2 logarithm.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym');
    Y = sym(log2(X.s));
else
    Y = mapcatch(-inf,X,'log');
    Y = Y/log(sym(2));
end
