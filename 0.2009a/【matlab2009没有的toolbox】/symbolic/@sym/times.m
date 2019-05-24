function X = times(A, B)
%TIMES  Symbolic array multiplication.
%   TIMES(A,B) overloads symbolic A .* B.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = sym(times(A.s,B.s));
else
  % Scalar expansion
  if ~isequal(size(A),size(B))
    if all(size(A)==1)
      A = A(ones(size(B)));
    elseif all(size(B)==1)
      B = B(ones(size(A)));
    else
      error('symbolic:sym:times:errmsg1','Array dimensions must agree.');
    end
  end

  X = A;
  for k = 1:numel(A)
    X(k) = mupadfeval('_mult',A(k),B(k));
  end
end
