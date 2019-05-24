function Y = sqrt(X)
%SQRT   Symbolic matrix element-wise square root.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(sqrt(X.s));
else
    Y = map(X,'sqrt');
end
