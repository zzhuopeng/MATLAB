%FINVERSE  逆関数
%
%   g = FINVERSE(f) は、f の逆関数を返します。f は、1 つのシンボリック変数、
%   いわゆる 'x' の関数を表わすシンボリック式です。このとき、g は g(f(x)) = x を
%   満たすシンボリック式です。
%
%   g = FINVERSE(f, v) は、独立変数としてシンボリック変数 v を使います。
%   このとき、g は g(f(v)) = v を満たすシンボリック式です。f が複数の
%   シンボリック変数を含んでいるときに、この書式を使います。
%
%   例:
%      finverse(1/tan(x)) は atan(1/x) を返します。
%
%      f = x^2+y;
%      finverse(f, y) は -x^2+y を返します。
%      finverse(f) は (-y+x)^(1/2) を返し、逆関数が固有でないことを示す
%         警告を表示します。
%
%   参考 SYM/COMPOSE.


%   Copyright 1993-2008 The MathWorks, Inc.
