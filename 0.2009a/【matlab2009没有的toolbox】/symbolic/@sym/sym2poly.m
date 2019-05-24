function c = sym2poly(p)
%SYM2POLY Symbolic polynomial to polynomial coefficient vector.
%   SYM2POLY(P) returns a row vector containing the coefficients 
%   of the symbolic polynomial P.
%
%   Example:
%      sym2poly(x^3 - 2*x - 5) returns [1 0 -2 -5].
%
%   See also POLY2SYM, SYM/COEFFS.

%   Copyright 1993-2008 The MathWorks, Inc.

p = expand(p);
x = symvar(p);

if isempty(x)
   % constant case
   c = double(p);

elseif numel(x) > 1
   error('symbolic:sym:sym2poly:errmsg1','Input has more than one symbolic variable.')

elseif isscalar(struct(p)) && strcmp(class(p.s),'maplesym')
    c = double(sym2poly(p.s));
elseif isempty(p)
    c = [];
else

    [c,stat] = mupadfeval('mlsym2poly',p,x);
    if stat ~= 0 || isempty(c) || isequal(c,sym('FAIL'))
      error('symbolic:sym:sym2poly:errmsg2','Not a polynomial.')
    else
        c = double(c(:).');
    end
end;
