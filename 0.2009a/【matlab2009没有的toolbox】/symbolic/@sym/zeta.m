function Z = zeta(n,X)
%ZETA   Symbolic Riemann zeta function.
%   ZETA(z) = sum(1/k^z,k,1,inf).
%   ZETA(n,z) = n-th derivative of ZETA(z)

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin == 1
   X = n;
   n = sym(0);
else
   X = sym(X);
   n = sym(n);
end

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Z = sym(zeta(n.s,X.s));
elseif all(size(n) == 1)
   Z = mapncatch(2,inf,X,'mlzeta',n);
elseif all(size(X) == 1)
   Z = mapcatch(inf,n,'mlzeta',X);
else
   error('symbolic:sym:zeta:errmsg1','One argument must be a scalar.')
end
