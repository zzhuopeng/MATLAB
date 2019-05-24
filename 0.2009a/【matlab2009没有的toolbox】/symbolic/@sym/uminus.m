function Y = uminus(X)
%UMINUS Symbolic negation.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(-X.s);
else
    Y = mupadfeval('_negate',X(:));
    Y = reshape(Y,size(X));
end
