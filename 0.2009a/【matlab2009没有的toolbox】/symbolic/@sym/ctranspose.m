function B = ctranspose(A)
%CTRANSPOSE Symbolic matrix complex conjugate transpose.
%   CTRANSPOSE(A) overloads symbolic A' .
%
%   Example: 
%      [a b; 1-i c]' returns  [ conj(a),     1+i]
%                             [ conj(b), conj(c)].
%
%   See also SYM/TRANSPOSE.

%   Copyright 1993-2008 The MathWorks, Inc.

if ndims(A) > 2
   error('symbolic:sym:ctranspose:errmsg1','Transpose on ND array is not defined.')
elseif all(size(A) == 1)
    fcn = 'conjugate';
else
    fcn = 'htranspose';
end
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    B = sym(ctranspose(A.s));
else
    B = mupadfeval(fcn,A);
end
