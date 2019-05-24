% Symbolic Math Toolbox
% Version 5.1 (R2008b) 04-Aug-2008
%
% 計算
%   diff        - 微分
%   int         - 積分
%   limit       - 極限値
%   taylor      - Taylor級数
%   jacobian    - ヤコビ行列
%   symsum      - 級数の総和
%
% 線形代数
%   diag        - 対角行列の作成、または、対角成分の抽出
%   triu        - 上三角行列
%   tril        - 下三角行列
%   inv         - 逆行列
%   det         - 行列式
%   rank        - ランク
%   rref        - 行列の簡約化
%   null        - ヌル空間に対する基底
%   colspace    - 列空間に対する基底
%   eig         - 固有値と固有ベクトル
%   svd         - 特異値と特異ベクトル
%   jordan      - Jordan正準型
%   poly        - 特性多項式
%   expm        - 行列指数
%   mldivide    - \  行列の左除算
%   mpower      - ^  行列のべき乗
%   mrdivide    - /  行列の除算
%   mtimes      - *  行列の乗算
%   transpose   - .' 行列の転置
%   ctranspose  - '  行列の複素共役転置
%
% 簡略化
%   simplify    - 簡略化
%   expand      - 展開
%   factor      - 因数分解
%   collect     - 係数をまとめる
%   simple      - 最も短い表現の検索
%   numden      - 分子と分母
%   horner      - 入れ子の多項式表現
%   subexpr     - 共通する部分式による式の書き換え
%   coeffs      - 多変数多項式の係数抽出
%   sort        - シンボリックベクトルあるいは多項式のソート
%   subs        - シンボリックな代入
%
% 方程式の解法
%   solve       - 代数方程式のシンボリックな解
%   dsolve      - 微分方程式のシンボリックな解
%   finverse    - 逆関数
%   compose     - 関数の合成
%
% 可変精度の演算
%   vpa         - 可変精度の演算
%   digits      - 可変精度の設定
%
% 積分変換
%   fourier     - フーリエ変換
%   laplace     - ラプラス変換
%   ztrans      - Z-変換
%   ifourier    - 逆フーリエ変換
%   ilaplace    - 逆ラプラス変換
%   iztrans     - 逆Z-変換
%
% 変換
%   double      - シンボリック行列を倍精度に変換
%   single      - シンボリック行列を単精度に変換
%   poly2sym    - 係数ベクトルをシンボリック多項式に変換
%   sym2poly    - シンボリック多項式を係数ベクトルに変換
%   char        - シンボリックオブジェクトを文字列に変換
%   int8        - 符号付き8ビット整数に変換
%   int16       - 符号付き16ビット整数に変換
%   int32       - 符号付き32ビット整数に変換
%   int64       - 符号付き64ビット整数に変換
%   uint8       - 符号なし8ビット整数に変換
%   uint16      - 符号なし16ビット整数に変換
%   uint32      - 符号なし32ビット整数に変換
%   uint64      - 符号なし64ビット整数に変換
%
% 基本演算
%   sym         - シンボリックオブジェクトの作成
%   syms        - シンボリックオブジェクト作成のショートカット
%   findsym     - シンボリック変数の決定
%   pretty      - シンボリック式のプリティプリント
%   latex       - シンボリック式のLaTeX表現
%   texlabel    - 文字列からProduces the TeXフォーマットの作成
%   ccode       - シンボリック式のCコード表現
%   fortran     - シンボリック式のFortran表現
%
% 数学および代数の演算
%   plus        - +  加算
%   minus       - -  減算
%   uminus      - -  negation.
%   times       - .* 配列の乗算
%   ldivide     - \  左除算
%   rdivide     - /  除算
%   power       - .^ 配列のべき乗
%   abs         - 絶対値
%   ceil        - 切り上げ (Ceiling)
%   conj        - 共役
%   colon       - コロン演算子
%   fix         - 整数部
%   floor       - 切り捨て (Floor)
%   frac        - 小数部
%   mod         - 剰余
%   round       - 丸め
%   quorem      - 商と余り
%   imag        - 虚数部
%   real        - 実数部
%   exp         - 指数
%   log         - 自然対数
%   log10       - 常用対数
%   log2        - 2を底とした対数
%   sqrt        - 平方根
%   prod        - 要素の積
%   sum         - 要素の和
%
% 論理演算子
%   isreal      - 実数配列の検出
%   eq          - 等価
%   ne          - 不等価
%
% 特殊関数
%   besseli     - Bessel関数 I
%   besselj     - Bessel関数 J
%   besselk     - Bessel関数 K
%   bessely     - Bessel関数 Y
%   erf         - Error関数
%   sinint      - 正弦積分関数
%   cosint      - 余弦積分関数
%   zeta        - Riemannのzeta関数
%   gamma       - シンボリックgamma関数
%   gcd         - 最大公約数
%   lcm         - 最小公倍数
%   hypergeom   - 一般超幾何関数
%   lambertw    - LambertのW関数
%   dirac       - Delta関数
%   heaviside   - Step関数
%
% 三角関数
%
%   acos        - 逆余弦
%   acosh       - 逆双曲線余弦
%   acot        - 逆正接
%   acoth       - 逆双曲線正接
%   acsc        - 逆余割
%   acsch       - 逆双曲線余割
%   asec        - 逆正割
%   asech       - 逆双曲線正割
%   asin        - 逆正弦
%   asinh       - 逆双曲線正弦
%   atan        - 逆正接
%   atanh       - 逆双曲線正接
%   cos         - 余弦
%   cosh        - 双曲線余弦
%   cot         - 余接
%   coth        - 双曲線余接
%   csc         - 余割
%   csch        - 双曲線余割
%   sec         - 正割
%   sech        - 双曲線正割
%   sin         - 正弦
%   sinh        - 双曲線正弦
%   tan         - 正接
%   tanh        - 双曲線正接
%
% 文字列の取り扱いのユーティリティ
%   isvarname   - 有効な変数名のチェック(MATLAB TOOLBOX)
%   vectorize   - シンボリック式のベクトル化
%   disp        - sym をtextとして表示
%   display     - 関数をsyms として表示
%   eval        - シンボリック表現の評価
%
% 教育的なグラフィカルアプリケーション
%   rsums       - Riemann和
%   ezcontour   - 簡単なコンタープロット
%   ezcontourf  - 簡単な塗りつぶしコンタープロット
%   ezmesh      - 簡単なメッシュ(サーフェス)プロット
%   ezmeshc     - メッシュとコンターの簡単な組み合わせプロット
%   ezplot      - 関数の簡単なプロット
%   ezplot3     - 3次元パラメトリック曲線の簡単なプロット
%   ezpolar     - 簡単な極座標プロット
%   ezsurf      - 簡単なサーフェスプロット
%   ezsurfc     - サーフェスとコンターの簡単な組み合わせプロット
%   funtool     - 関数計算機
%   taylortool  - Taylor級数計算機
%
% デモ
%   symintro    - Symbolic Toolboxの紹介
%   symcalcdemo - 計算のデモンストレーション
%   symlindemo  - シンボリックな線形代数のデモ
%   symvpademo  - 可変精度の演算のデモ
%   symrotdemo  - 平面回転の問題
%   symeqndemo  - シンボリックな式の解法のデモ
%
% Maple へのアクセス
%   maple       - Maple のカーネルへのアクセス (Student Version では使用できません)
%   mfun        - Maple 関数の数値評価 (Student Version では使用できません)
%   mfunlist    - MFUN の関数のリスト ('help mfunlist' と同じ)
%   mhelp       - Mapleのヘルプ (Student Version では使用できません)
%   procread    - Maple のプロシージャの挿入 (Extended Toolbox が必要です)

%   Copyright 1993-2008 The MathWorks, Inc. 
