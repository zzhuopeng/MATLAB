function Y = cos(X)
%COS    Symbolic cosine function.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(cos(X.s));
else
    Y = map(X,'cos');
end
