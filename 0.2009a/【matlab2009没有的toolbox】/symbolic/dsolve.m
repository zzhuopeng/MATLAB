function varargout = dsolve(varargin)
%DSOLVE Symbolic solution of ordinary differential equations.
%   DSOLVE('eqn1','eqn2', ...) accepts symbolic equations representing
%   ordinary differential equations and initial conditions.  Several
%   equations or initial conditions may be grouped together, separated
%   by commas, in a single input argument.
%
%   By default, the independent variable is 't'. The independent variable
%   may be changed from 't' to some other symbolic variable by including
%   that variable as the last input argument.
%
%   The letter 'D' denotes differentiation with respect to the independent
%   variable, i.e. usually d/dt.  A "D" followed by a digit denotes
%   repeated differentiation; e.g., D2 is d^2/dt^2.  Any characters
%   immediately following these differentiation operators are taken to be
%   the dependent variables; e.g., D3y denotes the third derivative
%   of y(t). Note that the names of symbolic variables should not contain
%   the letter "D".
%
%   Initial conditions are specified by equations like 'y(a)=b' or
%   'Dy(a) = b' where y is one of the dependent variables and a and b are
%   constants.  If the number of initial conditions given is less than the
%   number of dependent variables, the resulting solutions will obtain
%   arbitrary constants, C1, C2, etc.
%
%   Three different types of output are possible.  For one equation and one
%   output, the resulting solution is returned, with multiple solutions to
%   a nonlinear equation in a symbolic vector.  For several equations and
%   an equal number of outputs, the results are sorted in lexicographic
%   order and assigned to the outputs.  For several equations and a single
%   output, a structure containing the solutions is returned.
%
%   If no closed-form (explicit) solution is found, an implicit solution is
%   attempted.  When an implicit solution is returned, a warning is given.
%   If neither an explicit nor implicit solution can be computed, then a
%   warning is given and the empty sym is returned.  In some cases involving
%   nonlinear equations, the output will be an equivalent lower order
%   differential equation or an integral.
%
%   Examples:
%
%      dsolve('Dx = -a*x') returns
%
%        ans = C1/exp(a*t)
%
%      x = dsolve('Dx = -a*x','x(0) = 1','s') returns
%
%        x = 1/exp(a*s)
%
%      S = dsolve('Df = f + g','Dg = -f + g','f(0) = 1','g(0) = 2')
%      returns a structure S with fields
%
%        S.f = (i + 1/2)/exp(t*(i - 1)) - exp(t*(i + 1))*(i - 1/2)
%        S.g = exp(t*(i + 1))*(i/2 + 1) - (i/2 - 1)/exp(t*(i - 1))
%
%      dsolve('Df = f + sin(t)', 'f(pi/2) = 0')
%      dsolve('D2y = -a^2*y', 'y(0) = 1, Dy(pi/a) = 0')
%      S = dsolve('Dx = y', 'Dy = -x', 'x(0)=0', 'y(0)=1')
%      S = dsolve('Du=v, Dv=w, Dw=-u','u(0)=0, v(0)=0, w(0)=1')
%      w = dsolve('D3w = -w','w(0)=1, Dw(0)=0, D2w(0)=0')
%
%   See also SOLVE, SUBS.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.37.4.10.2.2 $  $Date: 2008/08/14 14:59:35 $

eng = symengine;
if strcmp(eng.kind,'maple')
    for k=1:nargin
        v = varargin{k};
        if isa(v,'sym')
            v = struct(v);
            varargin{k} = v.s;
        end
    end
    S = mapleengine('dsolve',varargin{:});
    if isa(S,'struct')
      v = sort(fieldnames(S));
      for j = 1:length(v)
          if j <= nargout
              varargout{j} = sym(S.(v{j}));
          end
      end
    else
        varargout{1} = sym(S);
    end
    return;
end

narg = nargin;

% The default independent variable is t.
x = sym('t');

if (narg==0) || all(varargin{narg}==' ')
   warning('symbolic:dsolve:warnmsg3','Empty equation')
   varargout{1} = sym([]);
   return
end

% Pick up the independent variable, if specified.
if all(varargin{narg} ~= '='),
   x = sym(varargin{narg}); 
   narg = narg-1;
end
% Concatenate equation(s) and initial condition(s) inputs into SYS.
sys_str = '';
for k = 1: narg
   sys_str = [sys_str varargin{k} ',']; %#ok
end

% Break SYS into pieces. Each such piece, Dstr, begins with the first
% character following a "D" and ends with the character preceding the
% next consecutive "D". Loop over each Dstr and do the following:
%   o add to the list of dependent variables
%   o replace derivative notation. E.g., "D3y" --> "(D@@3)y"
%
% A dependent variable is defined as a variable that is preceded by "Dk",
% where k is an integer.
%
[sys_parsed, err] = feval(symengine,'mlconvertode',sym(['[' sys_str(1:end-1) ']']),x);
if err == 0
  var_list = fullshape(sys_parsed(1));
  sys_sym = fullshape(sys_parsed(2));
else
    error('symbolic:dsolve:errmsg1d','Can not use D as a variable in DSOLVE.')
end
 
solflag = ''; errorflag = 0;
sys_len = length(sys_sym);
var_len = length(var_list);
% If the number of equations is less than the number of variables . . .
if sys_len < var_len
   % then reduce the number of variables.
   var_list = var_list(1:sys_len);
% If conversely, the number of equations exceed the number of variables . . .
elseif sys_len > var_len
   % then produce an error.
   errorflag = 1;
end

[R,stat] = feval(symengine,'mldsolve',sys_sym, var_list);

if stat ~= 0 && errorflag
   error('symbolic:dsolve:errmsg2','There are more ODEs than variables.')
end

if stat
   error('symbolic:dsolve:errmsg3',R)
end

Rc = char(sym(R));

% If no solution, give up
if isempty(Rc) || strcmp(Rc,'{}') || strcmp(Rc,'NIL')
   warning('symbolic:dsolve:warnmsg2','Explicit solution could not be found.');
   varargout = cell(1,nargout);
   varargout{1} = sym([]);
   return
end

nvars = length(var_list);

% If the output contains int, make it a symbolic vector.

if nvars == 1 && nargout <= 1

   % One variable and at most one output.
   % Return a single scalar or vector sym.
   varargout{1} = R;

else

   % Form the output structure
   for j = 1:nvars
       v = char(var_list(j));
       v = v(1:(find(v=='(')-1));
       S.(v) = R(:,j);
   end
   
   if nargout <= 1

      % At most one output, return the structure.
      varargout{1} = S;

   elseif nargout == nvars

      % Same number of outputs as variables.
      % Match results in lexicographic order to outputs.
      v = sort(fieldnames(S));
      for j = 1:nvars
         varargout{j} = S.(v{j});
      end

   else
      error('symbolic:dsolve:errmsg4', ...
         '%d variables does not match %d outputs.',nvars,nargout)
   end
end

