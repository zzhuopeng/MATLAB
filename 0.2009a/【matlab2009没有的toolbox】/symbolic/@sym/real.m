function X = real(Z)
%REAL   Symbolic real part.
%   REAL(Z) is the real part of a symbolic Z.
    
%   Copyright 1993-2008 The MathWorks, Inc.

X = (Z + conj(Z))/2;
