function [g,c,d] = gcd(a,b,x)
%GCD    Greatest common divisor.
%   G = GCD(A,B) is the symbolic greatest common divisor of A and B.
%   G = GCD(A,B,X) uses variable X instead of FINDSYM(A,1).
%   [G,C,D] = GCD(A,B,...) also returns C and D so that G = A*C + B*D.
%
%   Example:
%      syms x
%      gcd(x^3-3*x^2+3*x-1,x^2-5*x+4) 
%      returns x-1
%
%   See also SYM/LCM.

%   Copyright 1993-2008 The MathWorks, Inc.
 
a = sym(a);
b = sym(b);
if isscalar(struct(a)) && strcmp(class(a.s),'maplesym')
    if nargin < 3
        args = {a.s,b.s};
    else
        args = {a.s,b.s,x.s};
    end
    if nargout == 1
        g = sym(gcd(args{:}));
    else
        [g,c,d] = gcd(args{:});
        g = sym(g); c = sym(c); d = sym(d);
    end
else
    if nargin < 3
        x = findsym(a,1);
        if ~isequal(x,findsym(b,1))
            error('symbolic:sym:gcd:errmsg1','Cannot identify default symbolic variable.')
        end
    end
    if isempty(x) && nargout <= 1
        g = mupadfeval('mlgcd',a,b);
    elseif isempty(x)
        out = mupadfeval('mligcdex',a,b);
        g = fullshape(out(1)); 
        c = fullshape(out(2));
        d = fullshape(out(3));
    else
        out = mupadfeval('mlgcdex',a,b,x);
        g = fullshape(out(1));
        c = fullshape(out(2));
        d = fullshape(out(3));
    end
end
