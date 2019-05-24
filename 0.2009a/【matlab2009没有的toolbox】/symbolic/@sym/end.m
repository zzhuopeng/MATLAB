function y = end(x,varargin)
%END Last index in an indexing expression for a sym array.
%   END(A,K,N) is called for indexing expressions involving the sym
%   array A when END is part of the K-th index out of N indices.  For example,
%   the expression A(end-1,:) calls A's END method with END(A,1,2).
%
%   See also SYM.

%   Copyright 2008 The MathWorks, Inc. 

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
  y = feval('end',x.s,varargin{:});
else
  y = builtin('end',struct(x),varargin{:});
end
