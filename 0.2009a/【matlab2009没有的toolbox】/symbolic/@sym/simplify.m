function r = simplify(s,n)
%SIMPLIFY Symbolic simplification.
%   SIMPLIFY(S) simplifies each element of the symbolic matrix S.
%   SIMPLIFY(S,N) searches for a simplification in N steps. The default
%   value of N is 50.
%
%   Examples: 
%      simplify(sin(x)^2 + cos(x)^2) is 1 .
%      simplify(exp(c*log(sqrt(alpha+beta))))
%
%   See also SYM/SIMPLE, SYM/FACTOR, SYM/EXPAND, SYM/COLLECT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(s)) && strcmp(class(s.s),'maplesym')
    r = sym(simplify(s.s));
else
    if nargin == 1, n = 50; end
    r = map(s,'mlsimplify',n);
end
