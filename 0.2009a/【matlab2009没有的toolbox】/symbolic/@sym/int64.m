function Y = int64(X)
%INT64 Converts symbolic matrix to signed 64-bit integers.
%   INT64(S) converts a symbolic matrix S to a matrix of
%   signed 64-bit integers.
%
%   See also SYM, VPA, SINGLE, DOUBLE,
%   INT8, INT16, INT32, UINT8, UINT16, UINT32, UINT64.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.1.6.2.44.1 $  $Date: 2008/07/17 04:41:26 $

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    Y = int64(X.s);
else
    Y = int64(double(X));
end
