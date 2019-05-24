function X = ne(A, B)
%NE     Symbolic inequality test.
%   NE(A,B) overloads symbolic A ~= B.  The result is true if A and B do
%   not have the same string representation.  NE does not expand or simplify
%   the string expressions before making the comparison.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = A.s ~= B.s;
else
    X = ~eq(A,B);
end
