function I = besseli(nu,Z)
%BESSELI Symbolic Bessel function, I(nu,z).

%   Copyright 1993-2008 The MathWorks, Inc.

nu = sym(nu);
Z = sym(Z);
if isscalar(struct(Z)) && strcmp(class(Z.s),'maplesym')
    I = sym(besseli(nu.s,Z.s));
else
    if all(size(nu) == 1)
        I = mapncatch(2,inf,Z,'besseli',nu);
    elseif all(size(Z) == 1)
        I = mapcatch(inf,nu,'besseli',Z);
    else
        error('symbolic:sym:besseli:errmsg1','One argument must be a scalar.')
    end
end
