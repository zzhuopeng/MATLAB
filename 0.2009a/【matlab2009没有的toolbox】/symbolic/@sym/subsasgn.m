function y = subsasgn(x,a,b)
%SUBSASGN Subscripted assignment for a sym array.
%     A = SUBSASGN(A,S,B) is called for the syntax A(I)=B.  S is a structure
%     array with the fields:
%         type -- string containing '()' specifying the subscript type.
%                 Only parenthesis subscripting is allowed.
%         subs -- Cell array or string containing the actual subscripts.
%
%   See also SYM.

%   Copyright 2008 The MathWorks, Inc

if ~isa(b,'sym') && ~isequal(b,[])
    b = sym(b);
end
if ~isa(x,'sym')
    x = sym(x);
end
if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
  if isequal(b,[])
      % deleting elements from sx
      y = subsasgn(x.s,a,[]);
  else
      y = subsasgn(x.s,a,b.s);
  end
else
  sx = struct(x);
  nx = numel(sx);
  if isequal(b,[])
      % deleting elements from sx
      y = builtin('subsasgn',sx,a,[]);
  else
      y = builtin('subsasgn',sx,a,b);
      ny = numel(y);
      if ny > nx
          % filled elements need to be set to 0 instead of empty
          for k = 1:ny
              if isempty(y(k).s)
                  y(k).s = sym(0);
              end
          end
      end
  end
end
y = sym(y);
