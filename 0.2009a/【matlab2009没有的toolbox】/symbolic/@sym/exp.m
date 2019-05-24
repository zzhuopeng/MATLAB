function Y = exp(X)
%EXP    Symbolic matrix element-wise exponentiation.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(exp(X.s));
else
    Y = map(X,'exp');
end

