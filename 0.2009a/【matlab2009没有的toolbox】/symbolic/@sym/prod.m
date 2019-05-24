function p = prod(A,dim)
%PROD   Product of the elements.
%   For vectors, PROD(X) is the product of the elements of X.
%   For matrices, PROD(X) or PROD(X,1) is a row vector of column products
%   and PROD(X,2) is a column vector of row products.
%
%   See also SYM/SUM.
 
%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.8.4.1.16.1 $  $Date: 2008/07/17 04:41:37 $

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    if nargin == 1
        p = sym(prod(A.s));
    else
        p = sym(prod(A.s,dim));
    end
elseif nargin == 1 && any(size(A) == 1)
   p = sym(1);
   for k = 1:prod(size(A))
      p = p * A(k);
   end
elseif nargin == 1 || dim == 1
   p = sym(ones(1,size(A,2)));
   for i = 1:size(A,1)
      p = p .* A(i,:);
   end
else
   p = sym(ones(size(A,1),1));
   for j = 1:size(A,2);
      p = p .* A(:,j);
   end
end
