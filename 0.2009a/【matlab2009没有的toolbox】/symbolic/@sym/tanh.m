function Y = tanh(X)
%TANH   Symbolic hyperbolic tangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(tanh(X.s));
else
    Y = map(X,'tanh');
end
