function X = rdivide(A, B)
%RDIVIDE Symbolic array right division.
%   RDIVIDE(A,B) overloads symbolic A ./ B.
%
%   See also SYM/LDIVIDE, SYM/MRDIVIDE, SYM/MLDIVIDE, SYM/QUOREM.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = sym(rdivide(A.s,B.s));
else
    % Scalar expansion
    if ~isequal(size(A),size(B))
        if all(size(A)==1)
            A = A(ones(size(B)));
        elseif all(size(B)==1)
            B = B(ones(size(A)));
        else
            error('symbolic:sym:rdivide:errmsg1','Array dimensions must agree.');
        end
    end

    X = A;
    for k = 1:numel(A)
        if B(k) ~= 0
            X(k) = mupadfeval('_divide',A(k),B(k));
        elseif A(k) ~= 0
            X(k) = Inf;
        else
            X(k) = NaN;
        end
   end
end
