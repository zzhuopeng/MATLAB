function y = horzcat(varargin)
%HORZCAT Horizontal concatenation for sym arrays.
%   C = HORZCAT(A, B, ...) horizontally concatenates the sym arrays A,
%   B, ... .  For matrices, all inputs must have the same number of rows.  For
%   N-D arrays, all inputs must have the same sizes except in the second
%   dimension.
%
%   C = HORZCAT(A,B) is called for the syntax [A B].
%
%   See also VERTCAT.

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
  y = horzcat(args{:});
else
  args = cellfun(@(x)struct(x),args,'UniformOutput',false);
  y = builtin('horzcat',args{:});
end
y = sym(y);
