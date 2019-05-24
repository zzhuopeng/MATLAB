function y = subsref(x,a)
%SUBSREF Subscripted reference for a sym array.
%     B = SUBSREF(A,S) is called for the syntax A(I).  S is a structure array
%     with the fields:
%         type -- string containing '()' specifying the subscript type.
%                 Only parenthesis subscripting is allowed.
%         subs -- Cell array or string containing the actual subscripts.
%
%   See also SYM.

%   Copyright 2008 The MathWorks, Inc. 

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
  y = subsref(x.s,a);
else
  y = builtin('subsref',struct(x),a);
end
y = sym(y);
