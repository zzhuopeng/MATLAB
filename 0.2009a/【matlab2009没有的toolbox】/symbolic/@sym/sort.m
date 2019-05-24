function y = sort(x)
%SORT Sort symbolic vectors or polynomials.
%   Y = SORT(V) sorts the elements of a symbolic vector V
%   in numerical or lexicographic order.
%   Y = SORT(P) sorts the terms in a polynomial P in order
%   of decreasing powers.
%
%   Examples:
%      syms a b c d e x
%      sort(sym(magic(3))) = [1,2,3,4,5,6,7,8,9]
%      sort([a c e b d]) = [a b c d e]
%      sort([a c e b d]*x.^(0:4).') = 
%         d*x^4 + b*x^3 + e*x^2 + c*x + a
%
%   See also SYM/SYM2POLY, SYM/COEFFS.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
    y = sym(sort(x.s));
else
    if numel(x) == 1
        y = x;
    else
        s = x(:).';
        y = sym(mupadfeval('mlsort',s));
        if ndims(x)==2 && size(x,2)==1
            % Column vector
            y = y.';
        end
    end
end
