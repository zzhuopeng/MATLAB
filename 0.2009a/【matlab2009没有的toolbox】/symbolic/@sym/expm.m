function Y = expm(X)
%EXPM   Symbolic matrix exponential.
%   EXPM(A) is the matrix exponential of the symbolic matrix A.
%
%   Examples:
%      syms t
%      A = [0 1; -1 0]
%      expm(t*A)
%
%      A = sym(gallery(5))
%      expm(t*A)

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
   Y = sym(expm(X.s));
elseif all(size(X) == 1)
   Y = mupadfeval('exp',X);
elseif size(X,1) == size(X,2)
    [Y,msg] = mupadfeval('mlexpm',X);
    if msg > 0
      Y = sym([]);
      warning('symbolic:sym:expm:warnmsg1','Explicit matrix exponential could not be found.')
    end
else
   error('symbolic:sym:expm:errmsg1','Matrix must be square.')
end
