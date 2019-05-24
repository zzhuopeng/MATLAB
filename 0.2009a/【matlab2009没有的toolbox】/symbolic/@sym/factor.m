function f = factor(x)
%FACTOR Symbolic factorization.
%   FACTOR(S), where S is a SYM matrix, factors each element of S.
%   If S contains all integer elements, the prime factorization is computed.
%   To factor integers greater than 2^52, use FACTOR(SYM('N')).
%
%   Examples:
%
%      factor(x^9-1) is 
%      (x - 1)*(x^2 + x + 1)*(x^6 + x^3 + 1)
%
%      factor(sym('12345678901234567890')) is
%      2*3^2*5*101*3541*3607*3803*27961
%
%   See also SYM/FACTOR, SYM/SIMPLIFY, SYM/EXPAND, SYM/SIMPLE, SYM/COLLECT.

%   Copyright 1993-2008 The MathWorks, Inc.

% Try the integer factorization first.
% If it fails, try the symbolic expression factorization.

if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
    f = sym(factor(x.s));
else
    [f,stat] = map(x,'mlfactor');
    if stat == 2
        error('symbolic:sym:factor:errmsg1',f);
    end
end
