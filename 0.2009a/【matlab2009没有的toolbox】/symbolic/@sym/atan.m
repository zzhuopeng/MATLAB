function Z = atan(Y,X)
%ATAN   Symbolic inverse tangent.
%       With two arguments, ATAN(Y,X) is the symbolic form of ATAN2(Y,X).

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin < 2
    if isscalar(struct(Y)) && strcmp(class(Y.s),'maplesym')
        Z = sym(atan(Y.s));
    else
        Z = map(Y,'atan');
    end
else
    Y = sym(Y);
    X = sym(X);
    if ~isequal(size(X),size(Y))
        error('symbolic:sym:atan:errmsg1','Two arguments must be same size.')
    end
    if isscalar(struct(Y)) && strcmp(class(Y.s),'maplesym')
        Z = sym(atan(Y.s,X.s));
    else
        Z = Y;
        for k = 1:length(Y(:))
            Z(k) = mupadfeval('arg',X(k),Y(k));
        end
    end
end
