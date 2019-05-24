function y = mfun(fun,varargin)
%MFUN   Numeric evaluation of a special function.
%   MFUN('fun',p1,p2,...,pk), where 'fun' is the name of a Maple
%   function and the p's are numeric quantities corresponding to fun's 
%   parameters.  The last parameter specified may be a matrix. All other 
%   parameters must be the type specified by the Maple function.
%   MFUN numerically evaluates 'fun' with the specified parameters
%   and returns MATLAB doubles. Any singularity in 'fun' is returned 
%   as NaN. 
%
%   Example:
%      x = 0:0.1:5.0;
%      y = mfun('FresnelC',x)
%
%   See also MFUNLIST, MHELP.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.24.4.9.2.1 $  $Date: 2008/07/17 04:41:06 $

eng = symengine;
ismupad = strcmp(eng.kind,'mupad');
if ~ismupad
    for k=1:length(varargin)
        v = varargin{k};
        if isa(v,'sym')
            v = struct(v);
            varargin{k} = v.s;
        end
    end
    y = mapleengine('mfun',fun,varargin{:});
    return
end

if isequal(lower(fun),'hypergeom')
   y = hypergeom(varargin{:});
   return
end

currd = digits;
d = 16;
digits(d);
[fun,varargin] = map2mupfun(fun,varargin);

a = [];
for k = 1:length(varargin)-1
   t = varargin{k};
   if ~isnumeric(t)
      t = str2num(t);
      if isempty(t)
         error('symbolic:mfun:errmsg1', ...
            'Parameters must represent numeric quantities.')
      end
   end
   a = [a ',' char(sym(t))];
end;
if ~isempty(a), a = [a(2:end) ',']; end;

x = varargin{length(varargin)};
if ~isnumeric(x)
   x = str2num(x);
   if isempty(x)
      error('symbolic:mfun:errmsg1', ...
         'Parameters must represent numeric quantities.')
   end
end

siz = size(x);
x = x(:).';
nans = find(isnan(x));
x(nans) = 0;

% format arguments for integer and real x
if all(imag(x) == 0)
   if all(x == fix(x))
      form = ['%' int2str(d) '.0f,'];
   else
      form = ['%' int2str(d+6) '.' int2str(d) 'e,'];
   end
   y = sprintf(form,x);

% format arguments for complex x
else
   form = ['%' int2str(d+6) '.' int2str(d) 'e'];
   y = sprintf([form '#' form '*i,'],[real(x); abs(imag(x))]);
   p = find(y == '#');

   % add the correct signs for imaginary parts
   s = find(imag(x) >= 0);
   if any(s)
      y(p(s)) = setstr('+'*ones(1,length(s)));
   end
   s = find(imag(x) < 0);
   if ~isempty(s) & any(s)
      y(p(s)) = setstr('-'*ones(1,length(s)));
   end
end

% additional format for the Maple MEX file
y(length(y)) = [];
y = ['[' y ']'];

[r,st] = evalin(symengine,['float(eval(map(' y ', s->' fun '(' a 's))))']); 

if st == 0
   r = double(r);
   if isempty(r)
      error('symbolic:mfun:errmsg4','Cannot evaluate Maple result.')
   end
   r(nans) = NaN;
   y = reshape(r,siz);

elseif st == 1
   warning('symbolic:mfun:warnmsg1','Maple result too long.  String truncated.')
   y = r;

elseif st == 2

   % singularities in r
   if ~isempty(strfind(r,'division by zero')) || ~isempty(strfind(r,'NaN')) || ~isempty(strfind(r,'singularity'))
      y = [',' y(2:length(y)-1) ','];  % use commas as delimiters for ALL elements
      c = find(y == ',');
      u = NaN*ones(1,prod(siz));

      for k = 2:length(c)
         r = y( c(k-1)+1 : c(k)-1 );
         [r,st] = evalin(symengine,['float(' fun '(' a r '))']);
         if st == 0
            u(k-1) = double(r);
         end
      end

      u(nans) = NaN;
      y = reshape(u,siz);

   % Overflow
   elseif findstr(r,'too large')
      y = [',' y(2:length(y)-1) ','];  % use commas as delimiters for ALL elements
      c = find(y == ',');
      u = Inf*ones(1,prod(siz));

      for k = 2:length(c)
         r = y( c(k-1)+1 : c(k)-1 );
         [r,st] = evalin(symengine,['float(' fun '(' a r '))']);
         %         [r,st] = maple(['evalf(' fun '(' a r '))']);
         if st==0, u(k-1) = double(r); end
      end

      u(nans) = NaN;
      y = reshape(u,siz);

   else
      error('symbolic:mfun:errmsg2',r)
   end

% Other error messages
elseif st == 3
   error('symbolic:mfun:errmsg3',r)
elseif st == 5
   warning('symbolic:mfun:warnmsg2','Maple(quit, done or stop) ignored.')
end

digits(currd);

% Change function names and argument order or normalization for MuPAD
function [fun,args] = map2mupfun(fun,args)
fun(1) = lower(fun(1));
switch fun
  case 'ellipticF'
    args{1} = asin(args{1});
    args{2} = args{2}.^2;
  case {'ellipticK','ellipticCK','ellipticCE'}
    args{1} = args{1}.^2;        
  case 'ellipticE'
    if length(args) == 1
        args{1} = args{1}.^2;
    else
        args{1} = asin(args{1});
        args{2} = args{2}.^2;
    end
  case 'ellipticPi'
    if length(args) == 3
        args = {args{2},asin(args{1}),args{3}.^2};
    else
        args{2} = args{2}.^2;
    end
  case 'ellipticCPi'
    args{2} = args{2}.^2;
  case 'psi'
    if length(args) == 2
        args = fliplr(args);
    end
  case 'ei'
    fun = 'Ei';
  case 'li'
     fun = '((z)->Ei(ln(z)))';
  case 'ci'
    fun = 'cosint';
  case 'si'
    fun = 'sinint';
  case 'chi'
    fun = 'Chi';
  case 'shi'
    fun = 'Shi';
  case 'w'
    fun = 'lambertW';
  case 'gAMMA'
    if length(args) == 1
        fun = 'gamma';
    else
        fun = 'igamma';
    end
  case 'harmonic'
    fun = '((z)->psi(z+1)+eulergamma)';
  case 'lnGAMMA'
    fun = '((z)->ln(gamma(z)))';
  case 'ssi'
    fun = '((z)->sinint(z)-PI/2)';
  case 'zeta'
    if length(args) == 3
         error('symbolic:mfun:ZetavNotSupported',...
          'MuPAD does not support the three-argument form of zeta');
    else
        args=fliplr(args);
    end
    % polynomials
  case 't'
    fun = 'orthpoly::chebyshev1';
  case 'u'
    fun = 'orthpoly::chebyshev2';
  case 'g'
    fun = 'orthpoly::gegenbauer';
  case 'h'
    fun = 'orthpoly::hermite';
  case 'p'
    if length(args)==2
        fun = 'orthpoly::legendre';
    else
        fun = 'orthpoly::jacobi';
    end
  case 'l'
    fun = 'orthpoly::laguerre';
    if length(args)==2
        args = [args(1) 0 args(2)];
    end
  otherwise
    % assume matches MuPAD
end
