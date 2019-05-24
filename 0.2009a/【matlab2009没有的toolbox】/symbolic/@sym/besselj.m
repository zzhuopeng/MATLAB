function J = besselj(nu,Z)
%BESSELJ Symbolic Bessel function, J(nu,z).

%   Copyright 1993-2008 The MathWorks, Inc.

nu = sym(nu);
Z = sym(Z);

if isscalar(struct(Z)) && strcmp(class(Z.s),'maplesym')
    J = sym(besselj(nu.s,Z.s));
else
    if all(size(nu) == 1)
        J = mapncatch(2,inf,Z,'besselj',nu);
    elseif all(size(Z) == 1)
        J = mapcatch(inf,nu,'besselj',Z);
    else
        error('symbolic:sym:besselj:errmsg1','One argument must be a scalar.')
    end
end
