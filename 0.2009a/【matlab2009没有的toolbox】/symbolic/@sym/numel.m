function y = numel(x,varargin)
%NUMEL Number of elements in a sym array.
%   N = NUMEL(A) returns the number of elements in the sym array A.
%
%   N = NUMEL(A, VARARGIN) returns the number of subscripted elements, N, in
%   A(index1, index2, ..., indexN), where VARARGIN is a cell array whose
%   elements are index1, index2, ... indexN.
%
%   See also SYM, SIZE.

%   Copyright 2008 The MathWorks, Inc. 

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
  y = numel(x.s,varargin{:});
else
  y = builtin('numel',struct(x),varargin{:});
end
