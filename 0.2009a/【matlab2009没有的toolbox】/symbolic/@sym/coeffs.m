function [c,t] = coeffs(p,x)
%COEFFS Coefficients of a multivariate polynomial.
%   C = COEFFS(P) returns the coefficients of the polynomial P with
%   respect to all the indeterminates of P.
%   C = COEFFS(P,X) returns the coefficients of the polynomial P with
%   respect to X.
%   [C,T] = COEFFS(P,...) also returns an expression sequence of the
%   terms of P.  There is a one-to-one correspondence between the
%   coefficients and the terms of P. 
%
%   Examples:
%      syms x
%      t = 2 + (3 + 4*log(x))^2 - 5*log(x);
%      coeffs(expand(t)) = [ 11, 19, 16]      
%
%      syms a b c x
%      y = a + b*sin(x) + c*sin(2*x)
%      coeffs(y,sin(x)) = [a + c*sin(2*x), b]
%      coeffs(expand(y),sin(x)) = [a, b + 2*c*cos(x)]
%      
%      syms x y
%      z = 3*x^2*y^2 + 5*x*y^3
%      coeffs(z) = [5, 3] 
%      coeffs(z,x) = [5*y^3, 3*y^2]
%      [c,t] = coeffs(z,y) returns c = [5*x, 3*x^2], t = [y^3, y^2]
%
%   See also SYM/SYM2POLY.

%   Copyright 1993-2008 The MathWorks, Inc.

p = sym(p);
if isscalar(struct(p)) && strcmp(class(p.s),'maplesym')
    if nargin == 2
        x = sym(x);
        args = {p.s, x.s};
    else
        args = {p.s};
    end
    if nargout == 2
        [c,t] = coeffs(args{:});
        c = sym(c);
        t = sym(t);
    else
        c = sym(coeffs(args{:}));
    end
else
    if nargin == 1 && nargout < 2
        c = fliplr(mupadfeval('mlcoeffs',p));
    elseif nargout < 2
        c = fliplr(mupadfeval('mlcoeffs',p,x));
    else
        if nargin == 1
            x = findsym(p,1);
        end
        mat = mupadfeval('mlcoeffsterms',p,x);
        c = mat(:,1);
        t = x.^mat(:,2);
        c = c(:).';
        t = t(:).';
    end
end
