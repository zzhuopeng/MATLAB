%IFOURIER  逆フーリエ積分変換
%
%   f = IFOURIER(F) は、デフォルトの独立変数 w を持つスカラシンボル F の
%   逆フーリエ変換です。デフォルトの戻り値は x の関数です。逆フーリエ変換は、
%   w の関数に適用され、x の関数、すなわち F = F(w) => f = f(x) を返します。
%   F = F(x) の場合、IFOURIER は、t の関数、すなわち f = f(t) を返します。
%   定義により、f(x) = 1/(2*pi) * int(F(w)*exp(i*w*x),w,-inf,inf) と積分は、
%   w に関して行われます。
%
%   f = IFOURIER(F, u) は、デフォルトの x の代わりに、u の関数 f を作成します。
%   IFOURIER(F,u) <=> f(u) = 1/(2*pi) * int(F(w)*exp(i*w*u,w,-inf,inf)
%   ここで、u は、スカラシンボル (w に関する積分) です。
%
%   f = IFOURIER(F, v, u) は、デフォルト w の代わりに v の関数から構成される 
%   F を使います。  IFOURIER(F,v,u) <=>
%   f(u) = 1/(2*pi) * int(F(v)*exp(i*v*u,v,-inf,inf)
%   v に関する積分。
%
%   例:
%    syms t u w x
%    ifourier(w*exp(-3*w)*sym('Heaviside(w)'))   は   1/2/pi/(3-i*t)^2 
%    を返します。
%
%    ifourier(1/(1 + w^2),u) は、以下の結果を返します。
%         1/2*exp(-u)*Heaviside(u)+1/2*exp(u)*Heaviside(-u)
%
%    ifourier(v/(1 + w^2),v,u)   は   i/(1+w^2)*Dirac(1,-u) を返します。
%
%    ifourier(sym('fourier(f(x),x,w)'),w,x)   は   f(x) を返します。
%
%   参考 SYM/FOURIER, SYM/ILAPLACE, SYM/IZTRANS.


%   Copyright 1993-2008 The MathWorks, Inc.
