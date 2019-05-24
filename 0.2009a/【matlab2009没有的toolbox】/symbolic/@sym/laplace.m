function L = laplace(F,varargin)
%LAPLACE Laplace transform.
%   L = LAPLACE(F) is the Laplace transform of the scalar sym F with
%   default independent variable t.  The default return is a function
%   of s.  If F = F(s), then LAPLACE returns a function of t:  L = L(t).
%   By definition L(s) = int(F(t)*exp(-s*t),0,inf), where integration
%   occurs with respect to t.
%
%   L = LAPLACE(F,t) makes L a function of t instead of the default s:
%   LAPLACE(F,t) <=> L(t) = int(F(x)*exp(-t*x),0,inf).
%
%   L = LAPLACE(F,w,z) makes L a function of z instead of the
%   default s (integration with respect to w).
%   LAPLACE(F,w,z) <=> L(z) = int(F(w)*exp(-z*w),0,inf).
%
%   Examples:
%      syms a s t w x
%      laplace(t^5)           returns   120/s^6
%      laplace(exp(a*s))      returns   1/(t-a)
%      laplace(sin(w*x),t)    returns   w/(t^2+w^2)
%      laplace(cos(x*w),w,t)  returns   t/(t^2+x^2)
%      laplace(x^sym(3/2),t)  returns   3/4*pi^(1/2)/t^(5/2)
%      laplace(diff(sym('F(t)')))   returns   laplace(F(t),t,s)*s-F(0)
%
%   See also SYM/ILAPLACE, SYM/FOURIER, SYM/ZTRANS.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(F,'sym')
    F = sym(F);
end
if isscalar(struct(F)) && strcmp(class(F.s),'maplesym')
    for k = 1:length(varargin)
        varargin{k} = sym(varargin{k});
        varargin{k} = varargin{k}.s;
    end
    L = sym(laplace(F.s,varargin{:}));
else
    L = symtransform('laplace',F,varargin,'t','s','t');
end
