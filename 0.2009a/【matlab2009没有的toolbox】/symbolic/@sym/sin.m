function Y = sin(X)
%SIN    Symbolic sine function.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(sin(X.s));
else
    Y = map(X,'sin');
end

