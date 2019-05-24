function Y = bessely(nu,Z)
%BESSELY Symbolic Bessel function, Y(nu,z).

%   Copyright 1993-2008 The MathWorks, Inc.

nu = sym(nu);
Z = sym(Z);

if isscalar(struct(Z)) && strcmp(class(Z.s),'maplesym')
    Y = sym(bessely(nu.s,Z.s));
else
    if all(size(nu) == 1)
        Y = mapncatch(2,inf,Z,'bessely',nu);
    elseif all(size(Z) == 1)
        Y = mapcatch(inf,nu,'bessely',Z);
    else
        error('symbolic:sym:bessely:errmsg1','One argument must be a scalar.')
    end
end
