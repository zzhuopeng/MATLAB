function [result,status] = map(obj,fcn,varargin)
%MAP Map a function call for each element of a symbolic array
%   RESULT = MAP(X,FCN,...) evaluates FCN(X(n),...) in the symbolic
%   engine for each element X(n) of X. The result has the same shape as X.
%
%   [RESULT,STATUS] = MAP(...) returns the warning/error status.
%   When the statement execution is successful, RESULT is the result
%   and STATUS is 0. If the execution fails, RESULT is the corresponding 
%   warning/error message, and STATUS is a positive integer.

%   Copyright 2008 The MathWorks, Inc.

    if numel(obj) == 1 || isempty(fcn)
        [result,status] = mupadfeval(fcn,obj,varargin{:});
        checkstat(result,status,nargout);
        if status == 0
            result = sym(result);
        end
    else
        [result,status] = mupadfeval('mlmap',obj(:),fcn,varargin{:});
        checkstat(result,status,nargout);
        if status == 0
            result = reshape(sym(result),size(obj));
        end
    end
    
    function checkstat(result,status,n)
        if status ~= 0 && n == 1
            error('symbolic:map:MapError',result);
        end
