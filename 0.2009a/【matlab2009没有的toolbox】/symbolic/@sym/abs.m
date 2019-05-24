function Y = abs(X1,X2)
%ABS    Absolute value.
%   ABS(X) is the absolute value of the elements of X. When
%   X is complex, ABS(X) is the complex modulus (magnitude) of
%   the elements of X.

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin == 1
    if isscalar(struct(X1)) && strcmp(class(X1.s),'maplesym')
        Y = sym(abs(X1.s));
    else
        Y = map(X1,'abs');
    end
else
   Y = ['sign(' char(X2) ')'];
end
