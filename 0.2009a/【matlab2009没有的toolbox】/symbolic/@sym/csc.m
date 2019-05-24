function Y = csc(X)
%CSC    Symbolic cosecant.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(csc(X.s));
else
    Y = mapcatch(inf,X,'csc');
end

