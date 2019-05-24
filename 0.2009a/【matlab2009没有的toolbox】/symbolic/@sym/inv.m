function X = inv(A)
%INV    Symbolic matrix inverse.
%   INV(A) computes the symbolic inverse of A
%   INV(VPA(A)) uses variable precision arithmetic.
%
%   Examples:  
%      Suppose B is
%         [ 1/(2-t), 1/(3-t) ]
%         [ 1/(3-t), 1/(4-t) ]
%
%      Then inv(B) is
%         [     -(-3+t)^2*(-2+t), (-3+t)*(-2+t)*(-4+t) ]
%         [ (-3+t)*(-2+t)*(-4+t),     -(-3+t)^2*(-4+t) ]
%
%      digits(10);
%      inv(vpa(sym(hilb(3))));
%
%   See also VPA.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = sym(inv(A.s));
else
    if all(size(A) == 1)
        [X,stat] = mupadfeval('_divide',sym(1),A);
    else
        [X,stat] = mupadfeval('mlinvert',A);
    end
    if stat
        error('symbolic:sym:inv:errmsg1',X)
    end
end

