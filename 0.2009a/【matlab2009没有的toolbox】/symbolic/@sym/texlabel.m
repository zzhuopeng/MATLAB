function T = texlabel(varargin)
% TEXLABEL Produces the TeX format from a character string.
%   TEXLABEL(f) converts the expression f into the TeX equivalent
%   for title/label application.  It processes transliterated Greek
%   variables to print (in titles/labels) as actual Greek letters.
%
%   If the title/label is too long to fit into a plot window, then 
%   the center of the expression is removed and an ellipsis ...
%   is inserted.
%
%   TEXLABEL is used in EZSURF, EZMESH, etc. to generate TeX format
%   for the title, x-, y-, and z-labels for these plots.
%
%   Examples:
%    syms x y lambda12 delta
%    texlabel(sin(sqrt(x^2 + y^2))/sqrt(x^2 + y^2))
%          returns
%    {sin}(({x}^{2} + {y}^{2})^{{1}/{2}})/({x}^{2} + {y}^{2})^{{1}/{2}}
%
%    texlabel(3*(1-x)^2*exp(-(x^2) - (y+1)^2) - 10*(x/5 - x^3 - y^5)* ...
%         exp(-x^2-y^2) - 1/3*exp(-(x+1)^2 - y^2))
%          returns
%    ({3} ({x} - {1})^{2})/{exp}(({y} + {1})^{2} + {x}^{2}) -...+ ({10} {x}^{3} - {2} {x} + {10} {y}^{5})/{exp}({x}^{2} + {y}^{2})
%
%    texlabel(lambda12^(3/2)/pi - pi*delta^(2/3))
%          returns
%    {\lambda_{12}}^{{3}/{2}}/{\pi} - {\pi} {\delta}^{{2}/{3}}
%
%    texlabel(lambda12^(3/2)/pi - pi*delta^(2/3),'literal')
%          returns
%    {lambda12}^{{3}/{2}}/{pi} - {pi} {delta}^{{2}/{3}}

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.4.4.1 $  $Date: 2008/06/20 09:06:59 $

switch length(varargin)
case 1
   T = texlabel(char(varargin{1}));
otherwise
   T = texlabel(char(varargin{1}),varargin{2});
end
