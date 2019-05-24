%QUOREM  シンボリック行列の要素単位の商と余り
%
%   整数、または多項式の要素を持つシンボリック行列 A と B に対して、
%   [Q,R] = QUOREM(A,B) は、A = Q.*B+R となるように B による A の要素
%   単位の除算を行い、商 Q と余り R を返します。
%   多項式 QUOREM(A,B,x) に対して、findsym(A,1) あるいは findsym(B,1) の
%   代わりに変数 x が使われます。
%
%   例:
%      syms x
%      p = x^3-2*x+5
%      [q,r] = quorem(x^5,p)
%         q = x^2+2
%         r = -5*x^2-10+4*x
%      [q,r] = quorem(10^5,subs(p,'10'))
%         q = 101
%         r = 515
%
%   参考 SYM/MOD, SYM/RDIVIDE, SYM/LDIVIDE.


%   Copyright 1993-2008 The MathWorks, Inc.
