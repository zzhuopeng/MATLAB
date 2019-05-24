function F = ztrans(f,varargin)
%ZTRANS Z-transform.
%   F = ZTRANS(f) is the Z-transform of the scalar sym f with default
%   independent variable n.  The default return is a function of z:
%   f = f(n) => F = F(z).  The Z-transform of f is defined as: 
%      F(z) = symsum(f(n)/z^n, n, 0, inf),
%   where n is f's symbolic variable as determined by FINDSYM.  If
%   f = f(z), then ZTRANS(f) returns a function of w:  F = F(w).
%
%   F = ZTRANS(f,w) makes F a function of the sym w instead of the
%   default z:  ZTRANS(f,w) <=> F(w) = symsum(f(n)/w^n, n, 0, inf).
%
%   F = ZTRANS(f,k,w) takes f to be a function of the sym variable k:
%   ZTRANS(f,k,w) <=> F(w) = symsum(f(k)/w^k, k, 0, inf).
%
%   Examples:
%      syms k n w z
%      ztrans(2^n)           returns  z/(z-2)
%      ztrans(sin(k*n),w)    returns  (w*sin(k))/(w^2 - 2*cos(k)*w + 1)
%      ztrans(cos(n*k),k,z)  returns  (z*(z - cos(n)))/(z^2 - 2*cos(n)*z + 1)
%      ztrans(cos(n*k),n,w)  returns  (w*(w - cos(k)))/(w^2 - 2*cos(k)*w + 1)
%      ztrans(sym('f(n+1)')) returns  z*ztrans(f(n), n, z) - z*f(0)
%
%   See also SYM/IZTRANS, SYM/LAPLACE, SYM/FOURIER.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(f,'sym')
    f = sym(f);
end
if isscalar(struct(f)) && strcmp(class(f.s),'maplesym')
    for k = 1:length(varargin)
        varargin{k} = sym(varargin{k});
        varargin{k} = varargin{k}.s;
    end
    F = sym(ztrans(f.s,varargin{:}));
else
    F = symtransform('ztrans',f,varargin,'n','z','w');
end
