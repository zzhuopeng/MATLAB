function g = matlabFunction(f,varargin)
%matlabFunction Generate a MATLAB file or anonymous function from a sym
%   G = matlabFunction(F) generates a MATLAB file or anonymous 
%   function from sym object F. The free variables of F become the inputs
%   for the resulting function handle G. For example, if x is the
%   free variable of F then G(z) computes in MATLAB what subs(F,x,z)
%   computes in the symbolic engine. The function handle G can be 
%   used by functions in MATLAB like FZERO or by functions in
%   other toolboxes. The order of the inputs of G matches the order
%   returned by symvar(F).
%
%   G = matlabFunction(F,PARAM1,VALUE1,...) uses the specified parameter/value
%   pairs to change the generated function. The parameter names can 
%   be any of the following
%     'vars': input variables for G. The value, VAR, must be be a cell array 
%             of strings or a vector of symbolic variables. 
%             Each string or symbolic variable in VAR becomes an input to 
%             G. The order of variables in VAR becomes the order of the 
%             inputs for G. The number of variables listed in VAR must be
%             no smaller than the number of free variables in F.
%     'file': file name to store the generated code. The value, FILE, 
%             must be a string with a valid MATLAB function name. If FILE does
%             not end in '.m' it will be appended. If the file already exists it
%             will be overwritten.  A function handle to the function will be
%             returned in G.
%
%   Examples:
%     syms x y
%     r = x^2+y^2;
%     f = log(r)+1/r;
%     matlabFunction(f,'file','sample')
%     type sample.m
%       function RESULT = sample(x,y)
%       %SAMPLE
%       %    RESULT = SAMPLE(X,Y)
%       t7 = x.^2;
%       t8 = y.^2;
%       t9 = t7 + t8;
%       RESULT = log(t9)+1./t9;
%
%     syms x a b
%     matlabFunction(a*x + b,'vars',[x a b])
%     ans =
%       @(x,a,b)b+a.*x
%
%   See also: function_handle, subs, fzero

%   Copyright 2008 The MathWorks, Inc.
    
error(nargchk(1,inf,nargin,'struct'));

ip = inputParser;
ip.addParamValue('vars','',@isvars);
ip.addParamValue('file','',@isfunc);
ip.parse(varargin{:});
opts = ip.Results;

svars = symvar(f);
if isempty(opts.vars)
    v = svars;
else
    v = opts.vars;
end
if ~iscell(v)
    if ischar(v)
        v = {v};
    elseif isa(v,'sym')
        v = num2cell(v(:).');
        v = cellfun(@(x)char(x),v,'UniformOutput',false);
    end
end
if ~iscellstr(v)
    error('symbolic:sym:matlabFunction:InvalidVars',...
          ['The second input must be a string, a cell of strings '...
           'or an array of symbolic variables.']);
elseif ~all(cellfun(@(x)isvarname(x),v))
    error('symbolic:sym:matlabFunction:InvalidVarName',...
          'Variable names must be valid MATLAB variable names.');
end
if length(v) < length(svars)
    varnames = format(svars);
    error('symbolic:sym:matlabFunction:TooFewInputs',...
          ['Too few inputs specified for function handle. Free '...
           'variables are %s.'],varnames);
end
varnames = format(v);

if ~isempty(opts.file)
    file = normalize(opts.file,'.m');
    g = writeMATLAB(f,file,varnames);
else
    body = mup2mat(char(f));
    g = makeFhandle(varnames,vectorize(body));
end

% Safely make a function handle with given varnames and body
function SUBS_Fhandle = makeFhandle(SUBS_xvarnames,SUBS_body)
SUBS_Fhandle = eval(['@(' SUBS_xvarnames ')' vectorize(SUBS_body)]);

function r = mup2mat(r)
% MUP2MAT Mupad to MATLAB string conversion.
%   MUP2MAT(r) converts the Mupad string r containing
%   matrix, vector, or array to a valid MATLAB string.

% Deblank.
r(findstr(r,' ')) = [];
% Special case of the empty matrix or vector
if strcmp(r,'vector([])') || strcmp(r,'matrix([])') || ...
   strcmp(r,'array([])')
   r = [];
else
   % Remove matrix, vector, or array from the string.
   r = strrep(r,'matrix([[','['); r = strrep(r,'array([[','[');
   r = strrep(r,'vector([','['); r = strrep(r,'],[',';');
   r = strrep(r,']])',']'); r = strrep(r,'])',']');
end

% file = normalizeFile(file,ext) append extension ext if file doesn't 
% have one already.
function file = normalize(file,ext)
[p,f,x] = fileparts(file);
if isempty(x)
    file = [file ext];
end

% Horzcat sym array or cell array v with commas and optional str
function varnames = format(v)
if ~iscell(v)
    v = mat2cell(v,1,ones(length(v),1)); 
end
varnames = cellfun(@(x)[char(x) ','],v,'UniformOutput',false);
varnames = [varnames{:}];
varnames(end) = [];

% Generate MATLAB. f is the expr to generate. file is file name.
function g = writeMATLAB(f,file,varnames)
[fid,msg] = fopen(file,'wt');
if fid == -1
    error('symbolic:sym:matlabFunction:FileError',...
          'Could not create file %s: %s',file,msg);
end
tmp = onCleanup(@()fclose(fid));
f = feval(symengine,'mloptimize',f);
[path,fname] = fileparts(file);
fprintf(fid,'function RESULT = %s(%s)\n',fname,varnames);
symver = ver('symbolic');
fprintf(fid,'%%%s\n',upper(fname));
fprintf(fid,'%%    RESULT = %s(%s)\n\n',upper(fname),upper(varnames));
fprintf(fid,'%%    This function was generated by the Symbolic Math Toolbox version %s.\n',symver.Version);
fprintf(fid,'%%    %s\n\n',datestr(now));
for k = 1:length(f)-1
    eqnk = f(k);
    fprintf(fid,'%s;\n',vectorize(char(eqnk)));
end
last = vectorize(char(f(end)));
body = mup2mat(strtrim(last));
fprintf(fid,'RESULT = %s;\n',body);
g = str2func(fname);
tmp = [];

% validator for variable parameter
function t = isvars(x)
t = iscellstr(x) || (ischar(x)&&size(x,1)==1) || isa(x,'sym');

% validator for file parameter
function t = isfunc(x)
[path,file] = fileparts(x);
t = isvarname(file);

