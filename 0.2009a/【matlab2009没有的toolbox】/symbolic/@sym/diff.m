function R = diff(S,varargin)
%DIFF   Differentiate.
%   DIFF(S) differentiates a symbolic expression S with respect to its
%   free variable as determined by FINDSYM.
%   DIFF(S,'v') or DIFF(S,sym('v')) differentiates S with respect to v.
%   DIFF(S,n), for a positive integer n, differentiates S n times.
%   DIFF(S,'v',n) and DIFF(S,n,'v') are also acceptable.
%
%   Examples;
%      x = sym('x');
%      t = sym('t');
%      diff(sin(x^2)) is 2*x*cos(x^2)
%      diff(t^6,6) is 720.
%
%   See also SYM/INT, SYM/JACOBIAN, SYM/FINDSYM.

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin >= 4
   error('symbolic:sym:diff:errmsg1','DIFF can be called with at most 3 input arguments');
end

if ~isa(S,'sym')
    S = sym(S);
end
if isscalar(struct(S)) && strcmp(class(S.s),'maplesym')
  for k=1:length(varargin)
    x = varargin{k};
    if isa(x,'sym')
      varargin{k} = x.s;
    end
  end
  R = sym(diff(S.s,varargin{:}));
else
  n = 1;
  x = [];
  for j = 1:length(varargin)
    a = varargin{j};
    if isa(a,'sym')
      x = a.s;
    elseif isvarname(a)
      x = a;
    elseif isa(a,'double') && length(a) == 1
      n = a;
    else
      error('symbolic:sym:diff:errmsg2','Do not recognize argument number %d.',j)
    end
  end
  if isempty(x)
    x = findsym(S,1);
  end
  x = sym(x);
  if isempty(x)
    R = 0*S;
  elseif n == 0
    R = S;
  else
    if n > 1
      x = [char(x) '$' int2str(n)];
    end
    R = reshape(map(S(:),'diff',x),size(S));
  end
end
