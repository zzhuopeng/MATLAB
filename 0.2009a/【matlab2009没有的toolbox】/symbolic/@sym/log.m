function Y = log(X)
%LOG    Symbolic matrix element-wise natural logarithm.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(log(X.s));
else
    Y = mapcatch(-inf,X,'log');
end
