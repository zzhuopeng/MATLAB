function S = single(X)
%SINGLE Converts symbolic matrix to single precision.
%   SINGLE(S) converts the symbolic matrix S to a matrix of single
%   precision floating point numbers.  S must not contain any symbolic
%   variables, except 'eps'.
%
%   See also SYM, SYM/VPA, SYM/DOUBLE.

%   Copyright 1993-2006 The MathWorks, Inc.
%   $Revision: 1.1.6.3 $  $Date: 2006/06/20 20:52:38 $

S = single(double(X));
