function r = isreal(x)
%ISREAL True for real symbolic array.
%   ISREAL(X) returns true if X equals conj(X) and false otherwise.

%   Copyright 1993-2006 The MathWorks, Inc.
%   $Revision: 1.5.4.1 $  $Date: 2006/12/15 19:33:18 $

r = isequal(x,conj(x));
