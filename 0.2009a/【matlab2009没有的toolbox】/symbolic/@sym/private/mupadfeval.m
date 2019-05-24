function [S,err] = mupadfeval(cmd,varargin)
%MUPADFEVAL Evaluate a MuPAD function
%   RESULT = MUPADFEVAL(FCN,...) evalautes the MuPAD function FCN
%   with the specified inputs and returns the result in RESULT.
%   [RESULT,STATUS] = MUPADFEVAL(FCN,...) returns the error status
%   in status and error message in RESULT if status is non-zero.
    
%   Copyright 2008 The MathWorks, Inc.
    
    for k = 1:nargin-1
        v = varargin{k};
        if isempty(v)
            S = sym([]);
            err = 0;
            return;
        elseif ~ischar(v)
            if isa(v,'sym')
                varargin{k} = charcmd(v);
            else
                varargin{k} = charcmd(sym(v));
            end
        end
    end
    [S,err] = feval(symengine,cmd,varargin{:}); % returns sym
    if err == 0
        S = sym(S);
    elseif nargout == 1
        error('symbolic:sym:mupadfeval:evalerr',S);
    end
