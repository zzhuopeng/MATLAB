function F = fourier(f,varargin)
%FOURIER Fourier integral transform.
%   F = FOURIER(f) is the Fourier transform of the sym scalar f
%   with default independent variable x.  The default return is
%   a function of w.
%   If f = f(w), then FOURIER returns a function of t:  F = F(t).
%   By definition, F(w) = int(f(x)*exp(-i*w*x),x,-inf,inf), where
%   the integration above proceeds with respect to x (the symbolic
%   variable in f as determined by FINDSYM).
%
%   F = FOURIER(f,v) makes F a function of the sym v instead of 
%       the default w:
%   FOURIER(f,v) <=> F(v) = int(f(x)*exp(-i*v*x),x,-inf,inf).
%
%   FOURIER(f,u,v) makes f a function of u instead of the
%       default x. The integration is then with respect to u.
%   FOURIER(f,u,v) <=> F(v) = int(f(u)*exp(-i*v*u),u,-inf,inf).
%
%   Examples:
%    syms t v w x
%    fourier(1/t)   returns   pi*i*(2*heaviside(-w) - 1)
%    fourier(exp(-x^2),x,t)   returns  pi^(1/2)/exp(t^2/4)
%    fourier(exp(-t)*sym('heaviside(t)'),v)   returns  1/(i*v + 1)
%    fourier(diff(sym('F(x)')),x,w)   returns 
%          i*w*transform::fourier(F(x),x,-w)
%
%   See also SYM/IFOURIER, SYM/LAPLACE, SYM/ZTRANS.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(f,'sym')
    f = sym(f);
end
if isscalar(struct(f)) && strcmp(class(f.s),'maplesym')
    for k = 1:length(varargin)
        varargin{k} = sym(varargin{k});
        varargin{k} = varargin{k}.s;
    end
    F = sym(fourier(f.s,varargin{:}));
else
    F = symtransform('mlfourier',f,varargin,'x','w','v');
end
