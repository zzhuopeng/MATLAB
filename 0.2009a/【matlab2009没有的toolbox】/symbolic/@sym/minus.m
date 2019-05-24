function X = minus(A, B)
%MINUS  Symbolic subtraction.
%   MINUS(A,B) overloads symbolic A - B.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = sym(A.s - B.s);
else
    % Scalar expansion
    if ~isequal(size(A),size(B))
        if all(size(A)==1)
            A = A(ones(size(B)));
        elseif all(size(B)==1)
            B = B(ones(size(A)));
        else
            error('symbolic:sym:minus:errmsg1','Array dimensions must agree.');
        end
    end

    X = mupadfeval('_subtract',A(:),B(:));

    if all(size(X) == 1)
        X = X(ones(size(A)));
    end

    X = reshape(X,size(A));
end
