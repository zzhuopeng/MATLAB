function r = collect(s,x)
%COLLECT Collect coefficients.
%   COLLECT(S,v) regards each element of the symbolic matrix S as a
%   polynomial in v and rewrites S in terms of the powers of v.
%   COLLECT(S) uses the default variable determined by FINDSYM.
%
%   Examples:
%      collect(x^2*y + y*x - x^2 - 2*x)  returns (y - 1)*x^2 + (y - 2)*x
%
%      f = -1/4*x*exp(-2*x)+3/16*exp(-2*x)
%      collect(f,exp(-2*x))  returns -(x/4 - 3/16)/exp(2*x)
%
%   See also SYM/SIMPLIFY, SYM/SIMPLE, SYM/FACTOR, SYM/EXPAND, SYM/FINDSYM.

%   Copyright 1993-2008 The MathWorks, Inc.

s = sym(s);
if isscalar(struct(s)) && strcmp(class(s.s),'maplesym')
    if nargin == 2
        x = sym(x);
        args = {s.s, x.s};
    else
        args = {s.s};
    end
    r = sym(collect(args{:}));
else
    if nargin == 1
        x = findsym(s,1);
    end
    r = reshape(map(s(:),'mlcollect',x),size(s));
end

