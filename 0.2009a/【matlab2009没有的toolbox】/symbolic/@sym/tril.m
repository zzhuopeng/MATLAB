function Y = tril(X,offset)
%TRIL   Symbolic lower triangle.
%   TRIL(X) is the lower triangular part of X.
%   TRIL(X,K) is the elements on and below the K-th diagonal
%   of X .  K = 0 is the main diagonal, K > 0 is above the
%   main diagonal and K < 0 is below the main diagonal.
%
%   Examples:
%
%      Suppose
%      A =
%         [   a,   b,   c ]
%         [   1,   2,   3 ]
%         [ a+1, b+2, c+3 ]
% 
%      then
%      tril(A) returns
%         [   a,   0,   0 ]
%         [   1,   2,   0 ]
%         [ a+1, b+2, c+3 ]
%        
%      tril(A,1) returns
%         [   a,   b,   0 ]
%         [   1,   2,   3 ]
%         [ a+1, b+2, c+3 ]
%        
%      tril(A,-1) returns
%         [   0,   0,   0 ]
%         [   1,   0,   0 ]
%         [ a+1, b+2,   0 ]
%
%   See also SYM/TRIU.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.9.4.2 $  $Date: 2008/06/20 09:07:01 $

if nargin == 1, offset = 0; end;
if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
  Y = sym(tril(X.s,offset));
else
  Y = X - triu(X,offset+1);
end
