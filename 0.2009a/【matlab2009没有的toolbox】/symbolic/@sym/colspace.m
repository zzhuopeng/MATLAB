function B = colspace(A)
%COLSPACE Basis for column space.
%   The columns of B = COLSPACE(A) form a basis for the column space of A.
%   SIZE(B,2) is the rank of A.
%
%   Example:
%
%     colspace(sym(magic(4))) is
%
%     [ 1, 0,  0]
%     [ 0, 1,  0]
%     [ 0, 0,  1]
%     [ 1, 3, -3]
%
%   See also SYM/NULL.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    B = sym(colspace(A.s));
else
    if all(size(A) == 1)
        if A == 0
            B = sym([]); 
        else
            B = sym(1); 
        end
    else
        B = rref(A.').';
        k = 1;
        while k <= size(B,2)
            if all(B(:,k) == 0)
                B(:,k) = [];
            else
                k = k+1;
            end
        end
    end
end

