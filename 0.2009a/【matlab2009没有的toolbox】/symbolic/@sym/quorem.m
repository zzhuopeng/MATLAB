function [Q,R] = quorem(A,B,x)
%QUOREM Symbolic matrix element-wise quotient and remainder.
%   [Q,R] = QUOREM(A,B) for symbolic matrices A and B with integer or
%   polynomial elements does element-wise division of A by B and returns 
%   quotient Q and remainder R so that A = Q.*B+R.
%   For polynomials, QUOREM(A,B,x) uses variable x instead of findsym(A,1)
%   or findsym(B,1).
%
%   Example:
%      syms x
%      p = x^3-2*x+5
%      [q,r] = quorem(x^5,p)
%         q = x^2 + 2
%         r = 4*x - 5*x^2 - 10
%      [q,r] = quorem(10^5,subs(p,'10'))
%         q = 101
%         r = 515
%
%   See also SYM/MOD, SYM/RDIVIDE, SYM/LDIVIDE.

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(A,'sym')
    A = sym(A);
end
if ~isa(B,'sym')
    B = sym(B);
end

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    if nargin < 3
        [Q,R] = quorem(A.s,B.s);
    else
        if isa(x,'sym')
            x = x.s;
        end
        [Q,R] = quorem(A.s,B.s,x);
    end
    Q = sym(Q);
    R = sym(R);
    return;
end

if nargin < 3
   x = findsym(A,1);
   if isempty(x)
      x = findsym(B,1);
   end
end
x = sym(x);
if isempty(x)
    vars = {};
elseif isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    vars = {x.s};
else
    vars = {x};
end
if isscalar(struct(A)) && strcmp(class(A.s),'maplesym');
    [Q,R] = quorem(A.s,B.s,vars{:});
    Q = sym(Q); R = sym(R);
else
    if all(size(B) == 1)
        B = B(ones(size(A)));
    elseif all(size(A) == 1)
        A = A(ones(size(B)));
    end
    if ~isequal(size(A),size(B));
        error('symbolic:sym:quorem:errmsg1','Array dimensions must agree.')
    end
    Q = A;
    R = A;
    for k = 1:numel(A)
        out = mupadfeval('mlquorem',A(k),B(k),vars{:});
        Q(k) = out(1); R(k) = out(2);
    end
end
