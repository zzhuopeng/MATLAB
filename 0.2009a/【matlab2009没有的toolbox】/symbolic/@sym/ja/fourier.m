%FOURIER  フーリエ積分変換
%
%   F = FOURIER(f) は、デフォルトの独立変数 x を持つシンボリックスカラ f の
%   フーリエ変換です。デフォルトでは w の関数を返します。
%   f = f(w) ならば、FOURIER は、t の関数 F = F(t) を返します。定義により、
%   F(w) = int(f(x)*exp(-i*w*x),x,-inf,inf) となり、x (FINDSYM で決定される
%   ような f のシンボリック変数) に関して積分します。
%
%   F = FOURIER(f, v) は、デフォルトの w の代わりに、シンボリック v の関数 
%   F を計算します。
%   FOURIER(f,v) <=> F(v) = int(f(x)*exp(-i*v*x),x,-inf,inf)
%
%   FOURIER(f, u, v) は、デフォルトの x の代わりに、u の関数 f を計算します。
%   積分は、u に関して行われます。
%   FOURIER(f,u,v) <=> F(v) = int(f(u)*exp(-i*v*u),u,-inf,inf).
%
%   例:
%    syms t v w x
%    fourier(1/t) は i*pi*(Heaviside(-w)-Heaviside(w)) を返します。
%    fourier(exp(-x^2),x,t) は pi^(1/2)*exp(-1/4*t^2) を返します。
%    fourier(exp(-t)*sym('Heaviside(t)'),v) は 1/(1+i*v) を返します。
%    fourier(diff(sym('F(x)')),x,w) は i*w*fourier(F(x),x,w) を返します。
%
%   参考 SYM/IFOURIER, SYM/LAPLACE, SYM/ZTRANS.


%   Copyright 1993-2008 The MathWorks, Inc.
