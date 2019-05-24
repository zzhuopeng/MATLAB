function Y = acos(X)
%ACOS   Symbolic inverse cosine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(acos(X.s));
else
    Y = map(X,'acos');
end
