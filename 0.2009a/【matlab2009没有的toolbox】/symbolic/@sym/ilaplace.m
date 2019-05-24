function F = ilaplace(L,varargin)
%ILAPLACE Inverse Laplace transform.
%   F = ILAPLACE(L) is the inverse Laplace transform of the scalar sym L
%   with default independent variable s.  The default return is a
%   function of t.  If L = L(t), then ILAPLACE returns a function of x:
%   F = F(x).
%   By definition, F(t) = int(L(s)*exp(s*t),s,c-i*inf,c+i*inf)
%   where c is a real number selected so that all singularities 
%   of L(s) are to the left of the line s = c, i = sqrt(-1), and 
%   the integration is taken with respect to s.
%
%   F = ILAPLACE(L,y) makes F a function of y instead of the default t:
%       ILAPLACE(L,y) <=> F(y) = int(L(y)*exp(s*y),s,c-i*inf,c+i*inf).
%   Here y is a scalar sym.
%
%   F = ILAPLACE(L,y,x) makes F a function of x instead of the default t:
%   ILAPLACE(L,y,x) <=> F(y) = int(L(y)*exp(x*y),y,c-i*inf,c+i*inf),
%   integration is taken with respect to y.
%
%   Examples:
%      syms s t w x y
%      ilaplace(1/(s-1))              returns   exp(t)
%      ilaplace(1/(t^2+1))            returns   sin(x)
%      ilaplace(t^(-sym(5/2)),x)      returns   4/3/pi^(1/2)*x^(3/2)
%      ilaplace(y/(y^2 + w^2),y,x)    returns   cos(w*x)
%      ilaplace(sym('laplace(F(x),x,s)'),s,x)   returns   F(x)
%
%   See also SYM/LAPLACE, SYM/IFOURIER, SYM/IZTRANS.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(L,'sym')
    L = sym(L);
end
if isscalar(struct(L)) && strcmp(class(L.s),'maplesym')
    for k = 1:length(varargin)
        varargin{k} = sym(varargin{k});
        varargin{k} = varargin{k}.s;
    end
    F = sym(ilaplace(L.s,varargin{:}));
else
    F = symtransform('ilaplace',L,varargin,'s','t','x');
end
