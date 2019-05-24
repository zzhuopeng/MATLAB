function K = besselk(nu,Z)
%BESSELK Symbolic Bessel function, K(nu,z).

%   Copyright 1993-2008 The MathWorks, Inc.

nu = sym(nu);
Z = sym(Z);

if isscalar(struct(Z)) && strcmp(class(Z.s),'maplesym')
    K = sym(besselk(nu.s,Z.s));
else
    if all(size(nu) == 1)
        K = mapncatch(2,inf,Z,'besselk',nu);
    elseif all(size(Z) == 1)
        K = mapcatch(inf,nu,'besselk',Z);
    else
        error('symbolic:sym:besselk:errmsg1','One argument must be a scalar.')
    end
end
