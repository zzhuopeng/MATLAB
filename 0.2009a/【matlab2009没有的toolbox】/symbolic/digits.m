function r = digits(d)
%DIGITS Set variable precision digits.
%   Digits determines the accuracy of variable precision numeric computations.
%   DIGITS, by itself, displays the current setting of Digits.
%   DIGITS(D) sets Digits to D for subsequent calculations. D is an 
%      integer, or a string or sym representing an integer.
%   D = DIGITS returns the current setting of Digits. D is an integer.
%
%   See also VPA.

%   Copyright 1993-2008 The MathWorks, Inc. 

eng = symengine;
if strcmp(eng.kind,'maple')
  if nargin == 1
    mapleengine('digits',d);
  elseif nargout == 1
    r = mapleengine('digits');
  else
    mapleengine('digits');
  end
else
  if nargin == 1
    feval(symengine,'mlDigits', d);
  elseif nargout == 1
    r = eval(char(feval(symengine,'mlDigits')));
  else
    disp(' ');
    disp(['Digits = ' char(feval(symengine,'mlDigits'))])
    disp(' ');
  end
end
