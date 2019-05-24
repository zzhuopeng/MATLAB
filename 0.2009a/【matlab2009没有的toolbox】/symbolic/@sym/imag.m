function Y = imag(Z)
%IMAG   Symbolic imaginary part.
%   IMAG(Z) is the imaginary part of a symbolic Z.
    
%   Copyright 1993-2008 The MathWorks, Inc.

Y = (Z - conj(Z))/2i;

