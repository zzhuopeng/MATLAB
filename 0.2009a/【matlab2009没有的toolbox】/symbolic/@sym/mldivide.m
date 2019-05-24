function X = mldivide(A, B)
%MLDIVIDE Symbolic matrix left division.
%   MLDIVIDE(A,B) overloads symbolic A \ B.
%   X = A\B solves the symbolic linear equations A*X = B.
%   Warning messages are produced if X does not exist or is not unique.  
%   Rectangular matrices A are allowed, but the equations must be
%   consistent; a least squares solution is not computed.
%
%   See also SYM/MRDIVIDE, SYM/LDIVIDE, SYM/RDIVIDE, SYM/QUOREM.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if all(size(A) == 1)
   % Division by a scalar
   X = ldivide(A,B);

elseif ndims(A) > 2 || ndims(B) > 2
   error('symbolic:sym:mldivide:errmsg1','Input arguments must be 2-D.')

elseif size(A,1) ~= size(B,1)
   error('symbolic:sym:mldivide:errmsg2','First dimensions must agree.')

else
    if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
        X = sym(mldivide(A.s,B.s));
    else
        % Matrix divided by matrix
        if size(B,2) > 1
            % vectorize over columns
            n = size(B,2);
            X = sym(zeros(size(A,2),size(B,2)));
            for k=1:n
                X(:,k) = A\B(:,k);
            end
        else
            
            out = mupadfeval('mlmldivide',A,B);
            X = fullshape(out(1)); 
            rank = fullshape(out(2));
            
            % Solution does not exist.
            if isempty(X)
                warning('symbolic:sym:mldivide:warnmsg1','System is inconsistent. Solution does not exist.')
                X = Inf;
                X = sym(X(ones(size(A,2),size(B,2))));
            elseif double(rank) < min(size(A))
                warning('symbolic:sym:mldivide:warnmsg2','System is rank deficient. Solution is not unique.')
            else
                X = simplify(X);
            end
        end
    end
end
