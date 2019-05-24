%ZTRANS  Z-変換
%
%   F = ZTRANS(f) は、デフォルトの独立変数 n に関するスカラのシンボリック式 
%   f の z-変換です。デフォルトの出力は、z の関数 f = f(n) => F = F(z) です。
%   f の Z-変換は、次のように定義されます。
%      F(z) = symsum(f(n)/z^n, n, 0, inf),
%   ここで、n は、FINDSYM で決定されるような f のシンボリック変数です。
%   f = f(z) の場合、ZTRANS(f) は、w の関数 F = F(w) を返します。
%
%   F = ZTRANS(f, w) は、デフォルトの z の代わりに、w の関数 F を返します。  
%   ZTRANS(f,w) <=> F(w) = symsum(f(n)/w^n, n, 0, inf)
%
%   F = ZTRANS(f, k, w) は、シンボリック変数 k の関数 f を変換します。 
%   ZTRANS(f,k,w) <=> F(w) = symsum(f(k)/w^k, k, 0, inf)
%
%   例:
%      syms k n w z
%      ztrans(2^n)           は z/(z-2) を返します。
%      ztrans(sin(k*n),w)    は sin(k)*w/(1-2*w*cos(k)+w^2) を返します。
%      ztrans(cos(n*k),k,z)  は z*(-cos(n)+z)/(-2*z*cos(n)+z^2+1) を返します。
%      ztrans(cos(n*k),n,w)  は w*(-cos(k)+w)/(-2*w*cos(k)+w^2+1) を返します。
%      ztrans(sym('f(n+1)')) は z*ztrans(f(n),n,z)-f(0)*z を返します。
%
%   参考 SYM/IZTRANS, SYM/LAPLACE, SYM/FOURIER.


%   Copyright 1993-2008 The MathWorks, Inc.
