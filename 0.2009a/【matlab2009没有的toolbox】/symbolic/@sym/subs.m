function G = subs(F,X,Y,swap)
%SUBS   Symbolic substitution.  Also used to evaluate expressions numerically.
%   SUBS(S) replaces all the variables in the symbolic expression S with
%   values obtained from the calling function, or the MATLAB workspace.
%   
%   SUBS(S,NEW) replaces the free symbolic variable in S with NEW.
%   SUBS(S,OLD,NEW) replaces OLD with NEW in the symbolic expression S.
%   OLD is a symbolic variable, a string representing a variable name, or
%   a string (quoted) expression. NEW is a symbolic or numeric variable
%   or expression.  That is, SUBS(S,OLD,NEW) evaluates S at OLD = NEW.
%   The substitution is first attempted as a MATLAB expression resulting 
%   in the computation being done in double precision arithmetic if all 
%   the values in NEW are double precision. Convert the NEW values to SYM
%   to ensure symbolic or variable precision arithmetic.
%   When substituting for an expression (e.g. OLD = a*b) the substitution
%   is performed only if the expressions matches exactly. For example
%   subs(a*b^2,a*b,5) will not return 5*b.
%
%   If OLD and NEW are vectors or cell arrays of the same size, each element
%   of OLD is replaced by the corresponding element of NEW.  If S and OLD
%   are scalars and NEW is a vector or cell array, the scalars are expanded
%   to produce an array result.  If NEW is a cell array of numeric matrices,
%   the substitutions are performed elementwise.
%
%   Examples:
%     Single input:
%       Suppose a = 980 and C1 = 3 exist in the workspace.
%       The statement
%          y = dsolve('Dy = -a*y')
%       produces
%          y = exp(-a*t)*C1
%       Then the statement
%          subs(y)
%       produces
%          ans = 3*exp(-980*t)
%
%     Single Substitution:
%       subs(a+b,a,4) returns 4+b.
%
%     Multiple Substitutions:
%       subs(cos(a)+sin(b),{a,b},[sym('alpha'),2]) or
%       subs(cos(a)+sin(b),{a,b},{sym('alpha'),2}) returns
%       cos(alpha)+sin(2)
%   
%     Scalar Expansion Case: 
%       subs(exp(a*t),'a',-magic(2)) returns
%
%       [   exp(-t), exp(-3*t)]
%       [ exp(-4*t), exp(-2*t)]
%
%     Multiple Scalar Expansion:
%       subs(x*y,{x,y},{[0 1;-1 0],[1 -1;-2 1]}) returns
%         0  -1
%         2   0
%
%   See also SYM/SUBEXPR.

% Deprecated API:
%   If SUBS(S,OLD,NEW) does not change S, then SUBS(S,NEW,OLD) is tried.
%   This provides backwards compatibility with previous versions and 
%   eliminates the need to remember the order of the arguments.
%   SUBS(S,OLD,NEW,0) does not switch the arguments if S does not change.

%   Copyright 1993-2008 The MathWorks, Inc.

F = sym(F);

ismaple = isscalar(struct(F)) && strcmp(class(F.s),'maplesym');

if nargin == 1
    % initialize X and Y from workspace variables
    
    % Find the list of symbolic variables in F that do NOT contain pi.
    vars = findsym(F);
    if isa(vars,'sym') && isscalar(struct(vars)) && strcmp(class(vars.s),'maplesym')
        vars = char(vars);
        k1 = find(vars=='[',1)+1;
        k2 = find(vars==']',1)-1;
        vars = vars(k1:k2);
    end
    vars(vars == ' ') = [];
    % If F has no symbolic variables, just return F.
    if isempty(vars), G = double(F); return, end
    % Compute the number of symbolic variables (excluding pi).
    vars = regexp(vars,'\w+','match');
    nvars = length(vars);

    % Determine which variables are in the MATLAB workspace and
    % place them in the cell X.  Similarly, place the values of 
    % variables in the MATLAB workspace into the cell Y.
    eflag = zeros(1,nvars);
    for k = 1:nvars
        eflag(k) = evalin('caller',['exist(''' vars{k} ''',''var'')']);
        if ~eflag(k)
            eflag(k) = 2*evalin('base',['exist(''' vars{k} ''',''var'')']);
        end
    end
    einds = find(eflag);
    X = vars(einds);
    Y = cell(1,length(einds));
    for k = 1:length(einds)
        if eflag(einds(k)) == 1
            Y{k} = evalin('caller',vars{einds(k)});
        else
            Y{k} = evalin('base',vars{einds(k)});
        end
    end
elseif ~ismaple && nargin == 2
    % got Y and use free variable as X
    Y = X;
    X = symvar(F,1);
    if isempty(X), X = sym('x'); end
end

if ismaple
    args = {F.s};
    if isa(X,'sym'), X = X.s; end
    args(end+1) = {X};
    if nargin ~= 2
        if isa(Y,'sym'), Y = Y.s; end
        args(end+1) = {Y};
    end
    if nargin > 3
        args(end+1) = {swap};
    end
    G = sym(subs(args{:}));
    return;
end

% Check for appropriate forms of input.
msg = inputchk(X,Y);
if ~isempty(msg), error('symbolic:sym:subs:errmsg1',msg), end

% convert X strings to syms and wrap in cell array if needed
if iscell(X)
    X = cellfun(@(x)sym(x),X,'UniformOutput',false);
elseif ischar(X)
    X = {sym(X)};
else
    X = {X};
end

% convert Y to all syms or all numerics, and wrap in cell array if needed
if iscell(Y)
    Y = cellfun(@(x)symnumerics(x),Y,'UniformOutput',false);
    symclass = cellfun(@(x)isa(x,'sym'),Y);
    if any(symclass)
        Y = cellfun(@(x)sym(x),Y,'UniformOutput',false);
    end
elseif ischar(Y)
    Y = {sym(Y)};
elseif (ndims(Y) == 2) && all(size(Y) == size(X))
    indm = ones(size(Y,1),1);
    indn = ones(size(Y,2),1);
    Y = mat2cell(Y,indm,indn);
else
    Y = {Y};
end

% by now X is a cell array of syms and Y is a cell array of numerics or syms

% if X is a single item and Y is a cell array of values collapse those
% down into a single sym Y matrix
if numel(X)==1 && numel(X{1})==1 && numel(Y) > 1
    Y2 = sym([ Y{:} ]);
    if numel(Y2) == numel(Y)
        Y = {reshape(Y2,size(Y))};
    else
        Y = {Y2};
    end
end

% flatten X into scalars and make corresponding Y
[X,Y] = flatten(X,Y);

% pick out those X that are simple variable names
xvars = cellfun(@(x)isvarname(char(x)),X);

% pick out those Y that are sym objects
ysyms = cellfun(@(y)isa(y,'sym'),Y);

% if X is made of variable names (identifiers) then try MATLAB evaluation
if ~isempty(xvars) && all(xvars) && ~any(ysyms)
    xvarnames = cellfun(@(x)[char(x) ','],X,'UniformOutput',false);
    xvarnames = [xvarnames{:}];
    xvarnames(end) = [];
    body = map2mat(char(F));
    if ~isempty(body)
        try
            Fhandle = makeFhandle(xvarnames,body);
            G = Fhandle(Y{:});
            return;
        catch me %#ok - ignore all exceptions and have it try the slow method
        end
    end
end

% the evaluation in MATLAB didn't work so convert any numeric Y to sym
Y = cellfun(@(x)sym(x),Y,'UniformOutput',false);

% find which Y's are not scalar to determine output shape
yscalar = cellfun(@(x)isscalar(x),Y);
if all(yscalar)
    % the y's are scalar so the output will have size same as F
    G = F;
else
    ymatrix = ~yscalar;
    ysize = size(Y{find(ymatrix,1)});
    G = repmat(F,ysize);
end    
ismaple = isscalar(struct(G)) && strcmp(class(G.s),'maplesym');
for k=1:length(X)
    x = charcmd(X{k});
    y = Y{k};
    if yscalar(k)
        if ismaple
            G = sym(subs(G.s,x,y.s));
        else
            G = sym(mupadfeval('mlsubs', charcmd(G), [x '=' charcmd(y)]));
        end
    else
        for ky = 1:numel(y)
            if ismaple
                Gs = G.s;
                ys = y.s;
                G(ky) = sym(subs(Gs(ky),x,ys(ky)));
            else
                G(ky) = sym(mupadfeval('mlsubs',charcmd(G(ky)), ...
                                       [x '=' charcmd(y(ky))]));
            end
        end
    end
end

if nargin < 4, swap = 1; end
if isequal(G,F) && swap
   G = subs(F,Y,X,0);
end

%-------------------------
function SUBS_Fhandle = makeFhandle(SUBS_xvarnames,SUBS_body)
SUBS_Fhandle = eval(['@(' SUBS_xvarnames ')' vectorize(SUBS_body)]);

%-------------------------
function [fullX,fullY] = flatten(X,Y)
% Given cell array X with corresponding subsitutions Y flatten each
% non-scalar element of X and the corresponding Y into individual
% substitutions. fullX is a cell array of scalar syms and
% fullY is a cell array of values to subs for each x.
    fullX = {};
    fullY = {};
    for k=1:numel(X)
        if isscalar(X{k}) 
            fullX = [fullX X(k)]; %#ok
            fullY = [fullY Y(k)]; %#ok
        else
            x = num2cell(X{k});
            fullX = [fullX x(:).']; %#ok
            if numel(Y{k}) ~= numel(x)
                error('symbolic:subs:InvalidY',...
                'Number of elements in NEW must match number in OLD');
            end
            y = num2cell(Y{k});
            fullY = [fullY y(:).']; %#ok
        end
    end


%-------------------------
function msg = inputchk(x,y)
%INPUTCHK Generate error message for invalid cases
%  There are six possible legal cases
%  1) Inputs are cell arrays of the same length.
%  2) Inputs are sym arrays of the same size.
%  3) x is a scalar sym and sym(y) is legal
%  4) x is a scalar sym and y is a cell array
%  5) x and y are both single strings.
%  6) x is a varname string and y is a single string or sym(y) is legal.

msg = '';

if isa(x,'sym') && length(x)==1
  if ischar(y) && size(y,1)~=1,
    msg = 'String substitutions require 1-by-m strings.';
  end
elseif ischar(x) && ischar(y) && ...
      (length(sym(x))~=1 || length(sym(y))~=1) && isvarname(char(x))
  msg = 'String substitutions require 1-by-m strings.';
elseif (ischar(x) || isa(x,'sym')) && isvarname(char(x))
  if ischar(y) && size(y,1)~=1,
    msg = 'String substitutions require 1-by-m strings.';
  end
end

%-------------------------
function r = map2mat(r)
% MAP2MAT MuPAD to MATLAB string conversion.
%   MAP2MAT(r) converts the MuPAD string r containing
%   matrix, vector, or array to a valid MATLAB string.
%
%   Examples: map2mat(matrix([[a,b], [c,d]])  returns
%             [a,b;c,d]
%             map2mat(array([[a,b], [c,d]])  returns
%             [a,b;c,d]
%             map2mat(vector([[a,b,c,d]])  returns
%             [a,b,c,d]

% Deblank.
r(r == ' ') = [];
% Special case of the empty matrix or vector
if strcmp(r,'vector([])') || strcmp(r,'matrix([])') || ...
   strcmp(r,'array([])')
   r = '';
else
   % Remove matrix, vector, or array from the string.
   r = strrep(r,'matrix([[','['); r = strrep(r,'array([[','[');
   r = strrep(r,'vector([','['); r = strrep(r,'],[',';');
   r = strrep(r,']])',']'); r = strrep(r,'])',']');
end

%-------------------------
function x = symnumerics(x)
% Convert input to sym or numeric class
if ~isnumeric(x)
    if isempty(x)
        x = []; % make sure we have empty doubles
    else
        x = sym(x);
    end
end
