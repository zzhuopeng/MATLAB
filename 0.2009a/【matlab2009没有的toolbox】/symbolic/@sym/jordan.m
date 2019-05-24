function [V,J] = jordan(A)
%JORDAN   Jordan Canonical Form.
%   JORDAN(A) computes the Jordan Canonical/Normal Form of the matrix A.
%   The matrix must be known exactly, so its elements must be integers,
%   or ratios of small integers.  Any errors in the input matrix may
%   completely change its JCF.
%
%   [V,J] = JORDAN(A) also computes the similarity transformation, V, so
%   that V\A*V = J.  The columns of V are the generalized eigenvectors.
%
%   Example:
%      A = sym(gallery(5));
%      [V,J] = jordan(A)
%
%   See also SYM/EIG, SYM/POLY.

%   Copyright 1993-2008 The MathWorks, Inc.

if all(size(A) == 1)
   if nargout <= 1
      V = A;
   else
      J = A;
      V = sym(1);
   end
else
    if nargout <= 1
        if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
            V = sym(jordan(A.s));
        else
            V = mupadfeval('mljordan',A);
        end
    else
        if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
            [V,J] = jordan(A.s);
            V = sym(V); J = sym(J);
        else
            out = mupadfeval('mljordan',A,'All');
            V = fullshape(out(1));
            J = fullshape(out(2));
        end
    end
end

