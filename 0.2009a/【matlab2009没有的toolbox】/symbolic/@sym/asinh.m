function Y = asinh(X)
%ASINH  Symbolic inverse hyperbolic sine.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
  Y = sym(asinh(X.s));
else
  Y = map(X,'asinh');
end
