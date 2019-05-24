function y = vertcat(varargin)
%VERTCAT Vertical concatenation for sym arrays.
%   C = VERTCAT(A, B, ...) vertically concatenates the sym arrays A,
%   B, ... .  For matrices, all inputs must have the same number of columns.
%   For N-D arrays, all inputs must have the same sizes except in the first
%   dimension.
%
%   C = VERTCAT(A,B) is called for the syntax [A; B].
%
%   See also HORZCAT.

%   Copyright 2008 The MathWorks, Inc.

args = varargin;
for k=1:length(args)
  if ~isa(args{k},'sym')
    args{k} = sym(args{k});
  end
end
x = args{1};
if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
  args = cellfun(@(x)x.s,args,'UniformOutput',false);
  y = vertcat(args{:});
else
  args = cellfun(@(x)struct(x),args,'UniformOutput',false);
  y = builtin('vertcat',args{:});
end
y = sym(y);
