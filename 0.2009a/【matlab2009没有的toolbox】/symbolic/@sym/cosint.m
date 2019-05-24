function Z = cosint(X)
%COSINT Cosine integral function.
%  COSINT(x) = Gamma + log(x) + int((cos(t)-1)/t,t,0,x)
%  where Gamma is Euler's constant, .57721566490153286060651209...
%  Euler's constant can be evaluated with vpa('eulergamma').
%
%   See also SYM/SININT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Z = sym(cosint(X.s));
else
    Z = mapcatch(-inf,X,'Ci');
end

