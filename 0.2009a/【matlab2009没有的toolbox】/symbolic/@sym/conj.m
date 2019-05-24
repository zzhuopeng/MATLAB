function X = conj(Z)
%CONJ   Symbolic conjugate.
%   CONJ(Z) is the conjugate of a symbolic Z.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(Z)) && strcmp(class(Z.s),'maplesym')
    X = sym(conj(Z.s));
else
    X = map(Z,'conjugate');
end
