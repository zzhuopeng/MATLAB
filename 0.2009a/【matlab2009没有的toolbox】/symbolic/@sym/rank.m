function r = rank(A)
%RANK   Symbolic matrix rank.
%   RANK(A) is the rank of the symbolic matrix A.
%
%   Example:
%       rank([a b;c d]) is 2.

%   Copyright 1993-2008 The MathWorks, Inc.

if all(size(A) == 1)
   r = sym(A ~= 0);
elseif isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    r = sym(rank(A.s));
else
    r = mupadfeval('rank',A);
end;
