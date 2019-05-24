function Y = asin(X)
%ASIN   Symbolic inverse sine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(asin(X.s));
else
    Y = map(X,'asin');
end
