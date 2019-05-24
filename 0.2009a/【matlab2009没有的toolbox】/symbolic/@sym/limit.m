function r = limit(f,x,a,dir)
%LIMIT    Limit of an expression.
%   LIMIT(F,x,a) takes the limit of the symbolic expression F as x -> a.
%   LIMIT(F,a) uses findsym(F) as the independent variable.
%   LIMIT(F) uses a = 0 as the limit point.
%   LIMIT(F,x,a,'right') or LIMIT(F,x,a,'left') specify the direction
%   of a one-sided limit.
%
%   Examples:
%     syms x a t h;
%
%     limit(sin(x)/x)                 returns   1
%     limit((x-2)/(x^2-4),2)          returns   1/4
%     limit((1+2*t/x)^(3*x),x,inf)    returns   exp(6*t)
%     limit(1/x,x,0,'right')          returns   inf
%     limit(1/x,x,0,'left')           returns   -inf
%     limit((sin(x+h)-sin(x))/h,h,0)  returns   cos(x)
%     v = [(1 + a/x)^x, exp(-x)];
%     limit(v,x,inf,'left')           returns   [exp(a),  0]

%   Copyright 1993-2008 The MathWorks, Inc.

if ~isa(f,'sym')
    f = sym(f);
end

% Default x is findsym(f,1).
% Default a is 0.

% dir is empty unless 4 inputs are provided.

switch nargin
case 1, 
   a = '0';
   x = findsym(f,1);
   dir = '';
case 2, 
   a = x;
   x = findsym(f,1);
   dir = '';
case 3
   dir = '';
end

if ~isa(a,'sym')
    a = sym(a);
end
if ~isa(x,'sym')
    x = sym(x);
end
if any(size(x) > 1)
   error('symbolic:sym:limit:errmsg1','Variable must be a scalar.')
end
if any(size(a) > 1) 
   error('symbolic:sym:limit:errmsg2','Limit point must be a scalar.')
end

if isscalar(struct(f)) && strcmp(class(f.s),'maplesym');
    if isempty(dir)
        r = sym(limit(f.s, x.s, a.s));
    else
        r = sym(limit(f.s, x.s, a.s, dir));
    end
else
    dirpt = {[char(x) '=' char(a)]};
    if ~isempty(dir)
        dir(1)=upper(dir(1));
        dirpt(end+1) = { dir};
    end
    r = map(f,'mllimit',dirpt{:});
end
