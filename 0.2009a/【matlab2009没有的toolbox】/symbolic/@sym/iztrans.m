function f = iztrans(F,varargin)
%IZTRANS Inverse Z-transform.
%   f = IZTRANS(F) is the inverse Z-transform of the scalar sym F with
%   default independent variable z.  The default return is a function 
%   of n:  F = F(z) => f = f(n).  If F = F(n), then IZTRANS returns a
%   function of k: f = f(k).
%   f = IZTRANS(F,k) makes f a function of k instead of the default n.
%   Here m is a scalar sym.
%   f = IZTRANS(F,w,k) takes F to be a function of w instead of the
%   default symvar(F) and returns a function of k:  F = F(w) & f = f(k).
%
%   Examples:
%      iztrans(z/(z-2))        returns   2^n
%      iztrans(exp(x/z),z,k)   returns   x^k/k!
%
%   See also SYM/ZTRANS, SYM/LAPLACE, SYM/FOURIER.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(F,'sym')
    F = sym(F);
end
if isscalar(struct(F)) && strcmp(class(F.s),'maplesym')
    for k = 1:length(varargin)
        varargin{k} = sym(varargin{k});
        varargin{k} = varargin{k}.s;
    end
    f = sym(iztrans(F.s,varargin{:}));
else
    f = symtransform('iztrans',F,varargin,'z','n','k');
end

