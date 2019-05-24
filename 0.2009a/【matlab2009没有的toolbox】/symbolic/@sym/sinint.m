function z = sinint(x)
%SININT Sine integral function.
%   SININT(x) = int(sin(t)/t,t,0,x).
%
%   See also SYM/COSINT.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
    z = sym(sinint(x.s));
else
    z = mapcatch(inf,x,'Si');
end
