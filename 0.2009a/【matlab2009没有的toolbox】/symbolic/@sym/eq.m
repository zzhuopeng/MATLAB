function X = eq(A, B)
%EQ     Symbolic equality test.
%   EQ(A,B) overloads symbolic A == B.  The result is true if A and B
%   have the same string representation.  EQ does not expand or simplify
%   the string expressions before making the comparison.
    
%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.8.4.4 $  $Date: 2008/02/29 13:13:45 $

A = sym(A);
B = sym(B);
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    X = A.s == B.s;
else
    % Scalar expansion
    if ~isequal(size(A),size(B))
        if all(size(A)==1)
            A = A(ones(size(B)));
        elseif all(size(B)==1)
            B = B(ones(size(A)));
        else
            error('symbolic:sym:eq:errmsg1','Array dimensions must agree.');
        end
    end

    X = false(size(A));
    for k = 1:numel(A)
        a = A(k); b = B(k);
        S = mupadeval(['mlequal(' charcmd(a) ','...
                       charcmd(b) ')']);
        X(k) = strcmp(S,'TRUE');
    end
end
