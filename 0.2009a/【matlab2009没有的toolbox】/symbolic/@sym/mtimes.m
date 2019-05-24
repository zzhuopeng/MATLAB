function X = mtimes(A, B)
%TIMES  Symbolic matrix multiplication.
%   MTIMES(A,B) overloads symbolic A * B.
    
%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    X = sym(mtimes(A.s,B.s));
elseif all(size(A) == 1)
    % Scalar times matrix
    if isempty(B)
        X = B;
    else
        X = reshape(mupadfeval('_mult',B(:),A),size(B));
    end
    
elseif all(size(B) == 1)
    % Matrix times scalar
    if isempty(A)
        X = A;
    else
        X = reshape(mupadfeval('_mult',A(:),B),size(A));
    end
    
elseif ndims(A) > 2 || ndims(B) > 2
    error('symbolic:sym:mtimes:errmsg1','Input arguments must be 2-D.')
    
elseif size(A,2) == size(B,1)
    % Matrix multipliplication
    X = mupadfeval('_mult',A,B);
    
else
    error('symbolic:sym:mtimes:errmsg2','Inner matrix dimensions must agree.')
end
