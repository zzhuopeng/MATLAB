function Y = mapcatch(trapValue,X,fcn,varargin)
%MAPCATCH Map a function call over a symbolic array with trapped errors
%   RESULT = MAPCATCH(TRAPVAL,X,FCN,...) evaluates FCN(X(n),...) 
%   in the symbolic engine for each element X(n) of X. The result has 
%   the same shape as X. If FCN(X(n),...) errors then the entry RESULT(n) 
%   gets assigned TRAPVAL.

%   Copyright 2007 The MathWorks, Inc.

if nargin == 3
    [Y,stat] = map(X,fcn);
else
    [Y,stat] = map(X,fcn,varargin{:});
end

if stat
    % Singularities
    Y = X;
    for k = 1:numel(X)
        args = {fcn, X(k), varargin{:}};
        [Y(k),stat] = mupadfeval(args{:});
        if stat
            Y(k) = trapValue;
        end
    end
end
