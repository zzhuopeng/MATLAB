function [result,status] = mapn(n,obj,fcn,varargin)
%MAPN Map a function call over a symbolic array as the nth argument
%    RESULT = MAPN(N,X,FCN,...) evaluates FCN(...,X(n),...) where X(n)
%    is the Nth input. The result has the same shape as X.
%    [RESULT, STATUS] = MAPN(...) returns the error status in STATUS and
%    error message in RESULT if an error occurs.

%   Copyright 2008 The MathWorks, Inc.

    fixfcn = feval(symengine,'fp::fixargs',fcn,n,varargin{:});
    if nargout == 1
        result = map(obj,fixfcn);
    else
        [result,status] = map(obj,fixfcn);
    end
