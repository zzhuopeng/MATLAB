%TAYLOR  テイラー級数展開
%
%   TAYLOR(f) は、f に対して 5 次の Maclaurin 多項式近似です。
%   3 つのパラメータを任意の順序で与えることができます。
%   TAYLOR(f, n) は、(n-1) 次の Maclaurin 多項式です。
%   TAYLOR(f, a) は、点 a に関するテイラー多項式近似を求めます。
%   TAYLOR(f, x) は、FINDSYM(f) の代わりに独立変数 x を使います。
%
%   例:
%      taylor(exp(-x))   は、以下を返します。
%         1-x+1/2*x^2-1/6*x^3+1/24*x^4-1/120*x^5
%      taylor(log(x),6,1)   は、以下を返します。
%         x-1-1/2*(x-1)^2+1/3*(x-1)^3-1/4*(x-1)^4+1/5*(x-1)^5
%      taylor(sin(x),pi/2,6)   は、以下を返します。
%         1-1/2*(x-1/2*pi)^2+1/24*(x-1/2*pi)^4
%      taylor(x^t,3,t)   は、以下を返します。
%         1+log(x)*t+1/2*log(x)^2*t^2
%
%   参考 SYM/FINDSYM, SYM/SYMSUM.


%   Copyright 1993-2008 The MathWorks, Inc.
