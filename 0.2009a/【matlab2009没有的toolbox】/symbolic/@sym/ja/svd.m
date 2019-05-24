%SVD  シンボリックな特異値分解
%
%   出力引数を 1 つ設定した SIGMA = SVD(A) は、シンボリック行列 A の特異値を
%   含むシンボリックベクトルです。SIGMA = SVD(VPA(A)) は、可変精度の演算を
%   使って数値的な特異値を計算します。
%
%   出力引数を 3 つ設定した [U, S, V] = SVD(A) と [U, S, V] = SVD(VPA(A)) は
%   各列に特異なベクトルを持つ数値的なユニタリ行列 U と V、特異値を含む対角行列 
%   S を返します。これらは、A = U*S*V' を満たします。特異なベクトルの計算は、
%   可変精度の演算を使い、入力行列は数値でなければなりません。特異なベクトルを
%   シンボリックにすることはできません。
%
%   例:
%      A = sym(magic(4))
%      svd(A)
%      svd(vpa(A))
%      [U,S,V] = svd(A)
%
%      syms t real
%      A = [0 1; -1 0]
%      E = expm(t*A)
%      sigma = svd(E)
%      simplify(sigma)
%
%   参考 SVD, SYM/EIG, SYM/VPA.


%   Copyright 1993-2008 The MathWorks, Inc.
