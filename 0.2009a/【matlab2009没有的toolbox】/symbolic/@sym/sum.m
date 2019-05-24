function s = sum(A,dim)
%SUM    Sum of the elements.
%   For vectors, SUM(X) is the sum of the elements of X.
%   For matrices, SUM(X) or SUM(X,1) is a row vector of column sums
%   and SUM(X,2) is a column vector of row sums.
%
%   See also SYM/PROD.
 
%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    if nargin == 1
        s = sym(sum(A.s));
    else
        s = sym(sum(A.s,dim));
    end
elseif nargin == 1 && any(size(A) == 1)
   s = sym(0);
   for k = 1:numel(A)
      s = s + A(k);
   end
elseif nargin == 1 || dim == 1
   s = sym(zeros(1,size(A,2)));
   for i = 1:size(A,1)
      s = s + A(i,:);
   end
else
   s = sym(zeros(size(A,1),1));
   for j = 1:size(A,2);
      s = s + A(:,j);
   end
end
