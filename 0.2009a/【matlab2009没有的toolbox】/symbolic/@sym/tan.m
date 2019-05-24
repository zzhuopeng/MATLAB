function Y = tan(X)
%TAN    Symbolic tangent function.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(tan(X.s));
else
    Y = mapcatch(inf,X,'tan');
end
