function t = taylor(f,varargin)
%TAYLOR Taylor series expansion.
%   TAYLOR(f) is the fifth order Maclaurin polynomial approximation to f.
%   Three additional parameters can be specified, in almost any order.
%   TAYLOR(f,n) is the (n-1)-st order Maclaurin polynomial.
%   TAYLOR(f,a) is the Taylor polynomial approximation about point a.
%   TAYLOR(f,x) uses the independent variable x instead of FINDSYM(f).
%
%   Examples:
%      taylor(exp(-x))   returns
%        x^4/24 - x^5/120 - x^3/6 + x^2/2 - x + 1
%      taylor(log(x),6,1)   returns
%        x - (x - 1)^2/2 + (x - 1)^3/3 - (x - 1)^4/4 + (x - 1)^5/5 - 1
%      taylor(sin(x),pi/2,6)   returns
%        (pi/2 - x)^4/24 - (pi/2 - x)^2/2 + 1
%      taylor(x^t,3,t)   returns
%        (t^2*log(x)^2)/2 + t*log(x) + 1
%
%   See also SYM/FINDSYM, SYM/SYMSUM.

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin >= 5
   error('symbolic:sym:taylor:errmsg1','TAYLOR can be called with at most 4 input arguments');
end

f = sym(f);
if isscalar(struct(f)) && strcmp(class(f.s),'maplesym')
  for k=1:length(varargin)
    x = varargin{k};
    if isa(x,'sym')
      varargin{k} = x.s;
    end
  end
  t = sym(taylor(f.s,varargin{:}));
else
  n = NaN;
  a = sym(0);
  x = sym([]);
  for k = 1:length(varargin)
    v = varargin{k};
    if isa(v,'double')
      if (v == fix(v)) && (v > 0) && isnan(n)
        n = v;
      else
        a = sym(v);
      end
    else
      v = sym(v);
      vars = symvar(f);
      if ~isempty(vars) && any(v == vars)
        x = v;
      else
        a = v;
      end
    end
  end
  if isnan(n)
    n = 6;
  end
  if isempty(x)
    x = symvar(f,1);
  end
  t = mupadfeval('mltaylor',f,x,a,n);
end
