function p = poly(A,x)
%POLY   Symbolic characteristic polynomial.
%   POLY(A) computes the characteristic polynomial of the SYM matrix A.
%   The result is a symbolic polynomial in 'x' or 't'
%
%   POLY(A,v) uses 'v' instead of 'x'. v is a SYM.
%
%   Example:  
%      poly([a b; c d]) returns x^2 + (- a - d)*x + a*d - b*c
%
%   See also SYM/POLY, SYM/POLY2SYM, SYM/SYM2POLY, SYM/JORDAN, SYM/EIG, SYM/SOLVE.

%   Copyright 1993-2008 The MathWorks, Inc.

A = sym(A);

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    if nargin < 2
        p = sym(poly(A.s));
    else
        if ~isa(x,'sym')
            x = sym(x);
        end
        p = sym(poly(A.s,x.s));
    end
    return;
end    
if nargin < 2
   s = findsym(A);
   if isempty(findstr(s,'x'))
      x = sym('x');
   else
      x = sym('t');
   end
end
if all(size(A) == 1)
   p = x-A;
else
   p = mupadfeval('mlcharpoly',A,x);
end

