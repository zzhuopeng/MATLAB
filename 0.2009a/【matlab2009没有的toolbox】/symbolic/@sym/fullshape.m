function z = fullshape(x)
%FULLSHAPE Extract the full shape of symbolic expression x
%  Z = FULLSHAPE(X) returns the symbolic object x as an array
%  of the proper shape. Typically X is an element that was
%  extracted from a symbolic list object.

%   Copyright 2008 The MathWorks, Inc.

    z = mupadfeval('mlfullshape',x);
