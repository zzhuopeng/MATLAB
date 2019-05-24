function [V,D,p] = eig(A)
%EIG    Symbolic eigenvalues and eigenvectors.
%   With one output argument, LAMBDA = EIG(A) is a symbolic vector 
%   containing the eigenvalues of a square symbolic matrix A.
%
%   With two output arguments, [V,D] = EIG(A) returns a matrix V whose
%   columns are eigenvectors and a diagonal matrix D containing eigenvalues.
%   If the resulting V is the same size as A, then A has a full set of
%   linearly independent eigenvectors which satisfy A*V = V*D.
%
%   With three output arguments, [V,D,P] also returns P, a vector of indices
%   whose length is the total number of linearly independent eigenvectors,
%   so that A*V = V*D(P,P).  If A is n-by-n, then V is n-by-m where n is
%   the sum of the algebraic multiplicities and m is the sum of the geometric
%   multiplicities.
%
%   LAMBDA = EIG(VPA(A)) and [V,D] = EIG(VPA(A)) compute numeric eigenvalues
%   and eigenvectors using variable precision arithmetic.  If A does not
%   have a full set of eigenvectors, the columns of V will not be linearly
%   independent.
%
%   Examples:
%      [v,lambda] = eig([a,b,c; b,c,a; c,a,b])
%
%      R = sym(rosser);
%      eig(R)
%      [v,lambda] = eig(R)
%      eig(vpa(R))
%      [v,lambda] = eig(vpa(R))
%
%      A = sym(gallery(5)) does not have a full set of eigenvectors.
%      [v,lambda,p] = eig(A) produces only one eigenvector.
%
%   See also SYM/POLY, SYM/JORDAN, SYM/SVD, SYM/VPA.

%   Copyright 1993-2008 The MathWorks, Inc.

if all(size(A) == 1)

   % Monoelemental matrix

   if nargout < 2
      V = A;
   else
      V = sym(1);
      D = A;
      p = 1;
   end


elseif nargout < 2

    if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
        V = sym(eig(A.s));
    else
        % Eigenvalues only - return n-by-2 matrix of value, mult
        eigvals = mupadfeval('mleigenvalues',A);
        V = sym(zeros(length(A),1));
        n = 1;
        for k = 1:size(eigvals,1)
            mult = double(eigvals(k,2));
            V(n:n+mult-1) = eigvals(k,1);
            n = n+mult;
        end
   end

else
    if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
        [V,D,p] = eig(A.s);
        V = sym(V);
        D = sym(D);
    else
        % Eigensystem
        S = mupadfeval('mleigenvectors',A);
        V = fullshape(S(1));
        D = fullshape(S(2));
        p = fullshape(S(3));
        p = double(p);
        p = p(:).';
    end
end
