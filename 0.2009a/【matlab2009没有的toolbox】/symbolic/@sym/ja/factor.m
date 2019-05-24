%FACTOR  シンボリックな因数分解
%
%   FACTOR(S) は、S がシンボリック行列のとき、S を要素毎に因数分解します。
%   S が、すべて整数の要素を含む場合、素因数分解が実行されます。2^52 より
%   大きい整数を因数分解するには、FACTOR(SYM('N')) を使います。
%
%   例:
%
%      factor(x^9-1) は、以下のようになります。
%      (x-1)*(x^2+x+1)*(x^6+x^3+1)
%
%      factor(sym('12345678901234567890')) は、以下のようになります。
%      (2)*(3)^2*(5)*(101)*(3803)*(3607)*(27961)*(3541)
%
%   参考 SYM/FACTOR, SYM/SIMPLIFY, SYM/EXPAND, SYM/SIMPLE, SYM/COLLECT.


%   Copyright 1993-2008 The MathWorks, Inc.
