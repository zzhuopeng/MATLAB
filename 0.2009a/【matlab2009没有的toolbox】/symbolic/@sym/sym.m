function S = sym(x,a)
%SYM    Construct symbolic numbers, variables and objects.
%   S = SYM(A) constructs an object S, of class 'sym', from A.
%   If the input argument is a string, the result is a symbolic number
%   or variable.  If the input argument is a numeric scalar or matrix,
%   the result is a symbolic representation of the given numeric values.
%   If the input is a function handle the result is the symbolic form
%   of the body of the function handle.
%
%   x = sym('x') creates the symbolic variable with name 'x' and stores the
%   result in x.  x = sym('x','real') also assumes that x is real, so that
%   conj(x) is equal to x.  alpha = sym('alpha') and r = sym('Rho','real')
%   are other examples.  Similarly, k = sym('k','positive') makes k a 
%   positive (real) variable.  x = sym('x','clear') restores x to a
%   formal variable with no additional properties (i.e., insures that x
%   is NEITHER real NOR positive). Defining any of the symbols 
%
%      beta, gamma, psi, theta, zeta, D, E, I, O, Ei, Ci, Si
%
%   will treat that symbol as a variable instead of the usual MuPAD
%   definition. Defining the symbol 'i' will use sqrt(-1) in place of the
%   imaginary i until 'clear' is used.
%   See also: SYMS.
%
%   Statements like pi = sym('pi') and delta = sym('1/10') create symbolic
%   numbers which avoid the floating point approximations inherent in the
%   values of pi and 1/10.  The pi created in this way temporarily replaces
%   the built-in numeric function with the same name.
%
%   S = sym(A,flag) converts a numeric scalar or matrix to symbolic form.
%   The technique for converting floating point numbers is specified by
%   the optional second argument, which may be 'f', 'r', 'e' or 'd'.
%   The default is 'r'.
%
%   'f' stands for 'floating point'.  All values are represented in the
%   form (2^e+N*2^(e-52)) or '-(2^e+N*2^(e-52)) where N and e are integers.
%   For example, sym(1/10,'f') is (2^-4+2702159776422298*2^-56).
%
%   'r' stands for 'rational'.  Floating point numbers obtained by
%   evaluating expressions of the form p/q, p*pi/q, sqrt(p), 2^q and 10^q
%   for modest sized integers p and q are converted to the corresponding
%   symbolic form.  This effectively compensates for the roundoff error
%   involved in the original evaluation, but may not represent the floating
%   point value precisely.  If no simple rational approximation can be
%   found, an expression of the form p*2^q with large integers p and q
%   reproduces the floating point value exactly.  For example, sym(4/3,'r')
%   is '4/3', but sym(1+sqrt(5),'r') is 7286977268806824*2^(-51)
%
%   'e' stands for 'estimate error'.  The 'r' form is supplemented by a
%   term involving the variable 'eps' which estimates the difference
%   between the theoretical rational expression and its actual floating
%   point value.  For example, sym(3*pi/4,'e') is 3*pi/4-103*eps/249.
%
%   'd' stands for 'decimal'.  The number of digits is taken from the
%   current setting of DIGITS used by VPA.  Using fewer than 16 digits
%   reduces accuracy, while more than 16 digits may not be warranted.
%   For example, with digits(10), sym(4/3,'d') is 1.333333333, while
%   with digits(20), sym(4/3,'d') is 1.3333333333333332593,
%   which does not end in a string of 3's, but is an accurate decimal
%   representation of the floating point number nearest to 4/3.
%
%   See also SYMS, CLASS, DIGITS, VPA.

%   The flag 'unreal' is the same as 'clear'.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.48.4.10.2.2 $  $Date: 2008/07/25 19:29:44 $

eng = symengine;
if strcmp(eng.kind,'maple')
    switch nargin
      case 0, args = {};
      case 1, args = {x};
      case 2, args = {x,a};
    end
    S = class(struct('s',maplesym(args{:})),'sym');
    return;
end

if nargin == 0
   % Default constructor
   S = class(struct('s','0'),'sym');
elseif isempty(x)
   % Empty sym: sym([])
   S = class(struct('s',{}),'sym');
elseif isa(x,'sym')
   switch nargin
   case 1
      % Already a sym object
      S = x;
   case 2
      % Real/unreal/positive
      if ~strcmp(a,'real') && ~strcmp(a,'unreal') && ~strcmp(a,'positive') && ~strcmp(a,'clear')
         error('symbolic:sym:sym:errmsg1','Second argument %s not recognized.',a);
      elseif ~isscalar(x) && ~isvarname(x.s)
         error('symbolic:sym:sym:errmsg2',...
            'Real/Clear/Positive assumption applies only to symbolic variables.')
      else
         assumptions(x.s,a);
      end
   otherwise
      error('symbolic:sym:sym:errmsg3','Too many arguments');
   end
elseif isa(x,'mupadsym')
    S = struct('s',{x});
    S = class(S,'sym');
elseif isnumeric(x) || islogical(x)
   % Numeric scalar or matrix
   S = cell(size(x));
   if nargin < 2, a = 'r'; end
   for k = 1:numel(x)
      switch a
         case 'f'
            S{k} = symf(double(x(k)));
         case 'r'
            S{k} = symr(double(x(k)));
         case 'e'
            S{k} = syme(double(x(k)));
         case 'd'
            S{k} = symd(double(x(k)),digits);
         otherwise
            error('symbolic:sym:sym:errmsg6','Second argument %s not recognized.',a);
      end
   end;
   S = struct('s',S);
   S = class(S,'sym');
elseif isa(x,'char')
   % Simple variable, MuPAD output or char(sym(matrix))

   if any(strcmp(x,{'beta','gamma','psi','theta','zeta','D','O','E','Ei','Si','Ci','I'}))
       x = [x 'MLVar'];
   end
   
   S = char2sym(x);
   nargs = nargin;
   % Remove aliases for complex unit if allowed
   if isequal(x,'i')
       mupadeval('unalias(i,sqrtmone):');
       if nargs == 2 && (strcmp(a,'clear') || strcmp(a,'unreal'))
           mupadeval('alias(i=I):');
           mupadmex('i',11);
           return;
       else
           mupadeval('alias(sqrtmone=I):');
           mupadmex('sqrtmone',11);
       end
   end
   % Inform MuPAD of any real or unreal assumption.
   if nargs == 2
      if ~strcmp(a,'real') && ~strcmp(a,'unreal') && ~strcmp(a,'positive') && ~strcmp(a,'clear')
         error('symbolic:sym:sym:errmsg4','Second argument %s not recognized.',a);
      elseif ~isvarname(x)
         error('symbolic:sym:sym:errmsg5',...
            'Real/Clear/Positive assumption applies only to symbolic variables.')
      else
         assumptions(x,a);
      end
   end
elseif iscell(x)
    S = struct('s',x);
    S = class(S,'sym');
elseif isa(x,'struct')
   S = class(x,'sym');
elseif isa(x,'function_handle')
    str = char(x);
    ind = find(str == ')',1);
    str = str(ind+1:end);
    str = strrep(str,'.*','*');
    str = strrep(str,'./','/');
    str = strrep(str,'.^','^');
    S = sym(str);
else
   error('symbolic:sym:sym:errmsg7',...
      'Conversion to ''sym'' from ''%s'' is not possible.',class(x))
end


function S = symf(x)
%SYMF   Hexadecimal symbolic representation of floating point numbers.

if imag(x) > 0
   S = ['(' symf(real(x)) ')+(' symf(imag(x)) ')*' cplxunit];
elseif imag(x) < 0
   S = ['(' symf(real(x)) ')-(' symf(abs(imag(x))) ')*' cplxunit];
elseif isinf(x)
   if x > 0
      S = 'Inf';
   else
      S = '-Inf';
   end
elseif isnan(x)
   S = 'NaN';
elseif x == 0
   S = '0';
else
   [f,e] = log2(abs(x));
   f = 2*f-1;
   e = e-1;
   sf = int2str(f*2^52);
   se = int2str(e-52);
   se2 = int2str(e);
   S = ['(2^' se2 '+' sf '*2^' se ')'];
   if x < 0
       S = ['-' S];
   end
end


function [S,err] = symr(x)
%SYMR   Rational symbolic representation.
[S,err] = mupadmex(' ',9,x);

function S = syme(x)
%SYME   Symbolic representation with error estimate.

if imag(x) > 0
   S = ['(' syme(real(x)) ')+(' syme(imag(x)) ')*' cplxunit];
elseif imag(x) < 0
   S = ['(' syme(real(x)) ')-(' syme(abs(imag(x))) ')*' cplxunit];
elseif isinf(x)
   if x > 0
      S = 'Inf';
   else
      S = '-Inf';
   end
elseif isnan(x)
   S = 'NaN';
else
   [S,err] = symr(x);
   if err ~= 0
      err = eval(tofloat(['(' symfl(x) ')-(' S ')'],'32'))/eps;
   end
   if err ~= 0
      [n,d] = rat(err,1.e-5);
      if n == 0 || abs(n) > 100000
         [n,d] = rat(err/x,1.e-3);
         if n > 0
            S = [S '*(1+' int2str(n) '*eps/' int2str(d) ')'];
         else
            S = [S '*(1' int2str(n) '*eps/' int2str(d) ')'];
         end
         return
      end
      if n == 1
         S = [S '+eps'];
      elseif n == -1
         S = [S '-eps'];
      elseif n > 0
         S = [S '+' int2str(n) '*eps'];
      else
         S = [S int2str(n) '*eps'];
      end
      if d ~= 1
         S = [S '/' int2str(d)];
      end
   end
end


function S = symd(x,d)
%SYMD   Decimal symbolic representation.

if imag(x) > 0
   S = ['(' symd(real(x),d) ')+(' symd(imag(x),d) ')*' cplxunit];
elseif imag(x) < 0
   S = ['(' symd(real(x),d) ')-(' symd(abs(imag(x)),d) ')*' cplxunit];
elseif isinf(x)
   if x > 0
      S = 'Inf';
   else
      S = '-Inf';
   end
elseif isnan(x)
   S = 'NaN';
else
   S = tofloat(symfl(x),int2str(d));
end


function f = symfl(x)
%SYMFL  Exact representation of floating point number.
f = mupadmex(' ',10,double(x));

function S = char2sym(x)
%CHAR2SYM Convert a string, including MuPAD array output, to a sym.

if isempty(x) || all(x == ' ') || strcmp(x,'{}') 
   S = class(struct('s',{}),'sym');
elseif length(x)>7 && isequal(x(1:6),'array(') && ~isempty(findstr(x,'..'))
   S = mupadarray2sym(x);
elseif ~( x(1)=='[' || ...
        (length(x)>7 && ...
        ~(~strncmp(x,'vector([',8) && ...
          ~strncmp(x,'matrix([',8) && ...
          ~strncmp(x,'array([',7))))
   x(x==' ') = [];
   if strncmp(x,'undefined',9)
      S = sym(NaN);
   elseif isvarname(x) || strncmp(x,'Error',5) || strncmp(x,'at offset',9)
      % Variable names or MuPAD error messages are acceptable.
      S = class(struct('s',x),'sym');
   elseif strcmp(x,';') || strcmp(x,',')
      % Ugly trick to provide backward compatibility for V1.
      % sym([ s1 ';' s2 ]) and sym([ s1 ',' s2 ])
      S = class(struct('s',{}),'sym');
   else
       % Check if string is a valid symbolic expression.
       [S,err] = mupadeval(x);
      if ~err
         % Count commas not inside parentheses
         p = cumsum((S == '(') - (S == ')'));
         c = sum((S == ',') & (p == 0)); 
         if c >= 1 && S(1) ~= '{'
            S = sym(['[' x ']']);
         else
            S = class(struct('s',x),'sym');
         end
      elseif ~isempty(findstr(S,'division by zero')) || ...
             ~isempty(findstr(S,'is undefined'))
         S = sym(NaN);
      elseif ~isempty(findstr(S,'singularity'))
         S = sym(eval(x));
      elseif strncmp(S,'at offset',9)
         error('symbolic:sym:sym:errmsg8','Not a valid symbolic expression.');
      else
         error('symbolic:sym:sym:errmsg9',S)  
      end
   end
else
   if length(x)>11 && isequal(x(1:10),'transpose(') && x(end)==')'
       dotranspose = true;
       x = x(11:end-1);
   else
       dotranspose = false;
   end

   % Eliminate leading and trailing parens
   while x(1)=='(' && x(end)==')'
      x = x(2:end-1);
   end

   % Convert to MATLAB form
   if strncmp(x,'matrix',6) || ...
           strncmp(x,'vector',6) || ...
           strncmp(x,'array',5)
      x = map2mat(x);
      if isempty(x)
         S = sym([]);
         return
      end
   end

   % If the string is of the form, M = '[x - 1 x + 2;x * 3 x / 4]'
   % then find all of the alpha-numeric chararacters (id), the
   % arithmetic operators (+ - / * ^) (op), and spaces (sp) and
   % combine them into a vector V = 3*sp + 2*op + id.  That is,
   % id = isalphanum(M); op = isop(M); sp = find(M == ' ').  Let
   % spaces receive the value 3, operators 2, and alpha-numeric
   % characters 1.  Whenever the sequence 1 3 1 occurs, replace it
   % with 1 4 1.  Insert a comma whenever the number 4 occurs.
   % First remove all multiple blanks to create at most one blank.
   sp = (x == ' ');  % Location of all the spaces.
   b = findrun(sp); % Beginning (b) indices.
   sp(b) = 0;  % Mark the beginning of multiple blanks.
   x(sp) = []; % Set multiple blanks to empty string.
   V = isalphanum(x) + 2*isop(x) + 3*(x == ' ');
   if length(V) >= 3
      d = V(2:end-1)==3 & V(1:end-2)==1 & V(3:end)==1;
      V(find(d)+1) = 4;
   end
   x(V == 4) = ',';
   % String contains square brackets, so it is not a scalar.
   if x(1) == '['
      % Make '[a11 a12 ...; a21 a22 ...; ... ]' look like MuPAD array.
      % Version 1 compatibility.  Possibly useful elsewhere.
      % Replace multiple blanks with single blanks.
      k = findstr(x,'  ');
      while ~isempty(k);
         x(k) = [];
         k = findstr(x,'  ');
      end
      % Replace blanks surrounded by letters, digits or parens with commas.
      for k = findstr(x,' ');
         if (isalphanum(x(k-1)) || x(k-1) == ')') && ...
            (isalphanum(x(k+1)) || x(k+1) == '(')
            x(k) = ',';
         end
      end
      % Replace semicolons with '],['.
      for k = fliplr(findstr(';',x))
         x = [x(1:k-1) '],[' x(k+1:end)];
      end
   end
   % Deblank
   x(x==' ') = [];

   % Create indices that delimit rows
   p = cumsum((x=='(')-(x==')'));
   s = find((x=='[') & (p==0)) + 1;
   e = find((x==']') & (p==0)) - 1;
   
   if strncmp(x,'array([[',8) || strncmp(x,'matrix([[',9)
      s(1) = [];
      e(end) = [];
   end

   if isempty(s)
      % S will not be created in the loop below, so make it now
      S = class(struct('s',{}),'sym');
      return
   end

   for k = 1:length(s)
      % String with current row
      sk = x(s(k):e(k));
   
      % Eliminate commas within ()'s
      lp = find(sk == '(');
      rp = find(sk == ')');
      for i=1:length(lp)
         sk(lp(i):rp(i)) = ' ';
      end
   
      % Count commas to determine number of elements
      commas = find(sk == ',');
      if k == 1
         n = length(commas) + 1;
         S = struct('s',cell(k,n));
      elseif length(commas)+1 ~= n
         S = class(struct('s',x),'sym');
         return
      end
   
      % Start and end of column elements
      sr = [1 commas+1];
      er = [commas-1 length(sk)];
   
      sk = x(s(k):e(k));
      for j=1:n
         S(k,j).s = sk(sr(j):er(j));
      end
   end
   if dotranspose
       S = S.';
   end
   S = class(S,'sym');
end

%-------------------------

function b = findrun(x)
%FINDRUN Finds the runs of like elements in a vector.
%   FINDRUN(V) returns the beginning (b)
%   indices of the runs of like elements in the vector V.

d = diff([0 x 0]);
b = find(d == 1);

%-------------------------
function B = isalphanum(S)
%ISAPLHANUM is True for alpha-numeric characters.
%   ISALPHANUM(S) returns 1 for alpha-numeric characters or
%   underscores and 0 otherwise.
%
%   Example:  S = 'x*exp(x - y) + cosh(x*s^2)'
%             isalphanum(S)   returns
%            (1,0,1,1,1,0,1,0,0,0,1,0,0,0,0,1,1,1,1,0,1,0,1,0,1,0)

B = isletter(S) | (S >= '0' & S <= '9') | (S == '_');

%-------------------------

function B = isop(S)
%ISOP is True for + - * / or ^.
%   ISOP(S) returns 1 for plus, minus, times, divide, or 
%   exponentiation operators and 0 otherwise.

B = (S == '+') | (S == '-') | (S == '*') | ...
   (S == '/') | (S == '^');

%-------------------------

function r = map2mat(r)
% MAP2MAT Maple to MATLAB string conversion.
%   MAP2MAT(r) converts the Maple string r containing
%   matrix, vector, or array to a valid MATLAB string.
%
%   Examples: map2mat(matrix([[a,b], [c,d]])  returns
%             [a,b;c,d]
%             map2mat(array([[a,b], [c,d]])  returns
%             [a,b;c,d]
%             map2mat(vector([[a,b,c,d]])  returns
%             [a,b,c,d]

% Deblank.
r(r==' ') = [];
% Special case of the empty matrix or vector
if strcmp(r,'vector([])') || strcmp(r,'matrix([])') || ...
   strcmp(r,'array([])')
   r = [];
else
   % Remove matrix, vector, or array from the string.
   if ~isempty(findstr(r,'matrix([['))
      r = strrep(r,'matrix([[','[');
      r = strrep(r,'],[',';');
      r = strrep(r,']])',']');
   elseif ~isempty(findstr(r,'array([['))
      r = strrep(r,'array([[','[');
      r = strrep(r,'],[',';');
      r = strrep(r,']])',']');
   elseif ~isempty(findstr(r,'vector(['))
      r = strrep(r,'vector([','[');
      r = strrep(r,'])',']');
   end
end

%-------------------------

function s = cplxunit
s = char(mupadfeval('mlgetimagunit'));
if isequal(s,'sqrtmone')
    s = 'sqrt(-1)';
end

%-------------------------

function S = mupadarray2sym(x)
% Multidimensional arrays, added in MATLAB 7
mupadeval(['Mtlb := ' x]);
siz = double(sym(mupadfeval('mlgetdims','Mtlb'))); % return list of dims
S = struct('s',cell(siz));
n = prod(siz);
for k = 1:n
    S(k).s = mupadfeval('mlgetelem','Mtlb',num2str(k));
end
S = class(S,'sym');
mupadeval('delete Mtlb:');

%-------------------------

function assumptions(s,a)
switch a
  case 'real'
    mupadfeval('assume', s, 'Type::Real');
  case {'unreal','clear'}
    mupadeval(['_delete(' s '):']);
    mupadeval(['unalias(' s '):']);
  case 'positive'
    mupadeval(['assume(' s ' > 0):']);
end

function y = tofloat(x,d)
y = char(mupadfeval('mlfloat',x,d));
