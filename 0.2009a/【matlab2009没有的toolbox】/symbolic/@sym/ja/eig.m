%EIG  シンボリック行列の固有値と固有ベクトル
%
%   出力引数を 1 つ設定した LAMBDA = EIG(A) は、シンボリック正方行列 A の
%   固有値を含むシンボリックなベクトルです。
%
%   出力引数を 2 つ設定した [V,D] = EIG(A) は、各列が固有ベクトルからなる
%   行列 V と、固有値を含む対角行列 D を返します。結果の V が A と 同じサイズの
%   場合、A は、A*V = V*D を満たす線形独立な固有ベクトルの完全集合を持ちます。
%
%   出力引数を 3 つ設定した [V,D,P] は、A*V = V*D(P,P) を満たす、長さが線形
%   独立な固有ベクトルの総数のインデックスベクトル P も返します。
%   A が n 行 n 列の場合、V は n 行 m 列になります。このとき、n は代数的
%   重複度の和で、m は幾何的重複度の和です。
%
%   LAMBDA = EIG(VPA(A)) と [V,D] = EIG(VPA(A)) は、可変精度の演算を使って、
%   数値的に固有値と固有ベクトルを計算します。A が固有ベクトルの完全集合を
%   持たない場合、V の各列は線形独立ではありません。
%
%   例:
%      [v,lambda] = eig([a,b,c; b,c,a; c,a,b])
%
%      R = sym(gallery('rosser'));
%      eig(R)
%      [v,lambda] = eig(R)
%      eig(vpa(R))
%      [v,lambda] = eig(vpa(R))
%
%      A = sym(gallery(5)) は、固有ベクトルの完全集合を持ちません。
%      [v,lambda,p] = eig(A) は、固有ベクトルを 1 つだけ出力します。
%
%   参考 SYM/POLY, SYM/JORDAN, SYM/SVD, SYM/VPA.


%   Copyright 1993-2008 The MathWorks, Inc.
