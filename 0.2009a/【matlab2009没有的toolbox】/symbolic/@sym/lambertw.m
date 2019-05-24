function W = lambertw(k,X)
%LAMBERTW Lambert's W function.
%   W = LAMBERTW(X) is the solution to w*exp(w) = x.
%   W = LAMBERTW(K,X) is the K-th branch of this multi-valued function.
%   Reference: Robert M. Corless, G. H. Gonnet, D. E. G. Hare,
%   D. J. Jeffrey, and D. E. Knuth, "On the Lambert W Function",
%   Advances in Computational Mathematics, volume 5, 1996, pp. 329-359.

%   More information available from:
%   http://www.apmaths.uwo.ca/~rcorless/frames/PAPERS/LambertW

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin == 1
   X = k;
   k = sym(0);
else
   X = sym(X);
   k = sym(k);
end

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    W = sym(lambertw(k.s,X.s));
elseif all(size(k) == 1)
   W = mapncatch(2,inf,X,'lambertw',k);
elseif all(size(X) == 1)
   W = mapcatch(inf,k,'lambertw',X);
else
   error('symbolic:sym:lambertw:errmsg1','One argument must be a scalar.')
end
