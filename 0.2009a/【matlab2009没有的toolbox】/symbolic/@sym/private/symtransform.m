function Y = symtransform(fcn,X,varargs,varin,varout,varalt)
%SYMTRANSFORM Symbolic transformation
%   Y = SYMTRANSFORM(FCN,X,VARS,VARIN,VAROUT,VARALT) applies transformation FCN
%   to X given optional inputs VARS with default input variable VARIN and
%   default output variable VAROUT. FCN can be 'fourier','ifourier',
%   'laplace','ilaplace','ztrans','iztrans'. If the input function uses
%   VAROUT then have the output function use VARALT.

%   Copyright 2008 The MathWorks, Inc.

% Make X a sym and extract the variable closest to 'x'.
X = sym(X);

% If varin is a symbolic variable, make it the default.  Otherwise
% let the variable closest to x be the variable of integration.
if any(symvar(X) == sym(varin))
   var = sym(varin);
else
   var = symvar(X,1);
end

% If var is empty, then the default is varin.
if isempty(var)
   var = sym(varin);
end
% determine whether X is a function of varout or another variable.
s_test = strcmp(char(var),varout);

nargs = length(varargs);

% If X = X(varout), then return Y = Y(varalt)
if nargs == 0 && s_test == 1
    t = var;
    s = varalt;
end

if nargs == 0 && s_test == 0
    t = var;
    s = varout;
end

if nargs == 1
   t = var;
   if isempty(t), t = varout; end;
   s = sym(varargs{1});
end

if nargs == 2
    t = sym(varargs{1});
    s = sym(varargs{2});
end

Y = mupadfeval(fcn,X,t,s);
