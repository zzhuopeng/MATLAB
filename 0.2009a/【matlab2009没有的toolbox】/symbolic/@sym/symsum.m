function r = symsum(f,x,a,b)
%SYMSUM Symbolic summation.
%   SYMSUM(S) is the indefinite summation of S with respect to the
%   symbolic variable determined by FINDSYM.
%   SYMSUM(S,v) is the indefinite summation with respect to v.
%   SYMSUM(S,a,b) and SYMSUM(S,v,a,b) are the definite summation from a to b.
%
%   Examples:
%      symsum(k)                     k^2/2 - k/2
%      symsum(k,0,n-1)               (n*(n - 1))/2
%      symsum(k,0,n)                 (n*(n + 1))/2
%      simple(symsum(k^2,0,n))       n^3/3 + n^2/2 + n/6
%      symsum(k^2,0,10)              385
%      symsum(k^2,11,10)             0
%      symsum(1/k^2)                 -psi(k, 1)
%      symsum(1/k^2,1,Inf)           pi^2/6
%
%   See also SYM/INT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(f)) && strcmp(class(f.s),'maplesym')
    if nargin == 1
        r = symsum(f.s);
    elseif nargin == 2
        f = sym(f);
        x = sym(x);
        r = symsum(f.s,x.s);
    elseif nargin == 3
        f = sym(f);
        x = sym(x);
        a = sym(a);
        r = symsum(f.s,x.s,a.s);
    else
        f = sym(f);
        x = sym(x);
        a = sym(a);
        b = sym(b);
        r = symsum(f.s,x.s,a.s,b.s);
    end
    return;
end

if nargin == 1
   f = sym(f);
   x = findsym(f,1);
end

if nargin <= 2
   % Indefinite summation
   r = map(f,'sum',x);

else
   % Definite summation
   if nargin == 3
      b = a;
      a = x;
      x = findsym(f,1);
      if isempty(x), x = 'x'; end
   end
   x = sym(x);
   if isnumeric(a) && isnumeric(b) && a > b
       r = repmat(sym(0),size(f));
       return;
   end
   a = sym(a);
   b = sym(b);
   r = map(f,'mlsymsum',x,a,b);
end
