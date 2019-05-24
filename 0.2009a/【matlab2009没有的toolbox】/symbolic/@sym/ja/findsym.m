% FINDSYM   シンボリック式、または、行列内の変数の検出
%
% FINDSYM(S) は、S がシンボリックなスカラ、または、行列のとき、S の中の
% すべてのシンボリック変数を含む文字列を出力されます。
% 変数は、辞書順に、カンマ区切りで出力します。
% シンボリック変数を含んでいなければ、FINDSYM は空文字列を出力します。
% 定数 pi, i, j は、変数とはみなされません。
%
% FINDSYM(S,N) は、'x' に近い N 個のシンボリック変数を出力します。
%
% 例 :
%      findsym(alpha+a+b) は、a, alpha, b を出力します。
%      findsym(cos(alpha)*b*x1 + 14*y,2)は、x1, y を出力します。
%      findsym(y*(4+3*i) + 6*j) は、y を出力します。


%   Copyright 1993-2006 The MathWorks, Inc.
