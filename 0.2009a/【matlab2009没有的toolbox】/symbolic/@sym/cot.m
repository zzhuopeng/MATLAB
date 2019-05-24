function Y = cot(X)
%COT    Symbolic cotangent.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = sym(cot(X.s));
else
    Y = mapcatch(inf,X,'cot');
end

