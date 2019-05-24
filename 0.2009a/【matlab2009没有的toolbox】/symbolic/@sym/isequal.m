function c = isequal(a,b)
%ISEQUAL     Symbolic isequal test.
%   ISEQUAL(A,B) returns true iff A and B are identical.

%   Copyright 2008 The MathWorks, Inc.

c = false;
try
    if isequal(size(a),size(b))
        carray = a == b;
        if all(carray(:))
            c = true;
        end
    end
end
