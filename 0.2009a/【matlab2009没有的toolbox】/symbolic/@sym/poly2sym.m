function p = poly2sym(c,x)
%POLY2SYM Polynomial coefficient vector to symbolic polynomial.
%   POLY2SYM(C,V) is a polynomial in the symbolic variable V
%   with coefficients from the vector C.
% 
%   Example:
%       x = sym('x');
%       poly2sym([1 0 -2 -5],x)
%   is
%       x^3-2*x-5
%
%   See also SYM/SYM2POLY, POLYVAL.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.9.4.1.16.1 $  $Date: 2008/07/17 04:41:35 $

eng = symengine;
if strcmp(eng.kind,'maple')
    if isa(c,'sym')
        c = c.s;
    end
    if nargin == 1
        if ~isa(x,'sym')
            x = sym(x);
        end
        p = sym(poly2sym(c,x.s));
    else
        p = sym(poly2sym(c));
    end
else
    p = sym(0);
    for a = c(:).'
        p = p*x + a;
    end
    p = expand(p);
end
p = expand(p);
