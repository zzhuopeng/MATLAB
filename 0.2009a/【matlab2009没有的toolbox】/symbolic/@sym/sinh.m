function Y = sinh(X)
%SINH   Symbolic hyperbolic sine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(sinh(X.s));
else
    Y = map(X,'sinh');
end
