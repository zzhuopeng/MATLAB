function r = horner(p)
%HORNER Horner polynomial representation.
%   HORNER(P) transforms the symbolic polynomial P into its Horner,
%   or nested, representation.
%
%   Example:
%       horner(x^3-6*x^2+11*x-6) returns
%           x*(x*(x-6)+11)-6

%   See Also SIMPLIFY, SIMPLE, FACTOR, COLLECT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(p)) && strcmp(class(p.s),'maplesym')
    r = sym(horner(p.s));
else
    r = p;
    for k=1:numel(r)
        r(k) = mupadfeval('mlhorner',p(k),findsym(p(k),1));
    end
end

