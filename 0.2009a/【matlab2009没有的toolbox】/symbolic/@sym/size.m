function [varargout] = size(x,n)
%SIZE Size of a sym array.
%   D = SIZE(A), for an M-by-N sym matrix A, returns the two-element
%   row vector D = [M,N] containing the number of rows and columns in the
%   matrix.  For N-D sym arrays, SIZE(A) returns a 1-by-N vector of
%   dimension lengths.  Trailing singleton dimensions are ignored.
%
%   [M,N] = SIZE(A), for a sym matrix A, returns the number of rows
%   and columns in A as separate output variables. 
%   
%   [M1,M2,M3,...,MN] = SIZE(A), for N>1, returns the sizes of the first N 
%   dimensions of the sym array A.  If the number of output arguments
%   N does not equal NDIMS(A), then for:
%
%   N > NDIMS(A), SIZE returns ones in the "extra" variables, i.e., outputs
%                 NDIMS(A)+1 through N.
%   N < NDIMS(A), MN contains the product of the sizes of dimensions N
%                 through NDIMS(A).
%  
%   M = SIZE(A,DIM) returns the length of the dimension specified by the
%   scalar DIM.  For example, SIZE(A,1) returns the number of rows. If DIM >
%   NDIMS(A), M will be 1.
%
%   See also SYM.

%   Copyright 2008 The MathWorks, Inc. 

ismaple = isscalar(struct(x)) && strcmp(class(x.s),'maplesym');
if ismaple
  args = {x.s};
else
  args = {struct(x)};
end
if nargin > 1
  args(end+1)={n};
end
if ismaple
  y = size(args{:});
else
  y = builtin('size',args{:});
end
if nargout > 1
  for k = 1:nargout
    if k > length(y)
      varargout{k} = 1;
    else
      varargout{k} = y(k);
    end
  end
  if nargout < length(y)
    varargout{end} = prod(y(nargout:end));
  end
else
  varargout{1} = y;
end

