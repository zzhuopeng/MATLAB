function Y = mapncatch(n,trapValue,X,fcn,varargin)
%MAPCATCH Map a function call over a symbolic array with trapped errors
%   RESULT = MAPCATCH(N,TRAPVAL,X,FCN,...) evaluates FCN(...,X(n),...) 
%   in the symbolic engine for each element X(n) of X where X(n)
%   is the Nth input. The result has the same shape as X. If FCN(...,X(n),...)
%   errors then the entry RESULT(n) gets assigned TRAPVAL.

%   Copyright 2007 The MathWorks, Inc.

if nargin == 4
    [Y,stat] = mapn(n,X,fcn);
else
    [Y,stat] = mapn(n,X,fcn,varargin{:});
end

if stat
    % Singularities
    Y = X;
    low = varargin(1:n-1);
    high = varargin(n:end);
    for k = 1:numel(X)
        [Y(k),stat] = mupadfeval(fcn,low{:},X(k),high{:});
        if stat
            Y(k) = trapValue;
        end
    end
end
