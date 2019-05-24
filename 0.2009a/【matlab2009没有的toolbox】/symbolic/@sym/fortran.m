function f = fortran(s,varargin)
%FORTRAN  Fortran representation of a symbolic expression.
%   FORTRAN(S) is a fragment of Fortran that evaluates symbolic expression S.
%   FORTRAN(S,'file',FILE) writes an optimized code fragment to file FILE.
%
%   Examples:
%      syms x
%      f = taylor(log(1+x));
%      fortran(f) =
%
%        t0 = x-x**2*(1.0D0/2.0D0)+x**3*(1.0D0/3.0D0)-x**4*(1.0D0/4.0D0)+x*
%        ~*5*(1.0D0/5.0D0)
%
%      H = sym(hilb(3));
%      fortran(H) =
%
%        H(1,1) = 1
%        H(1,2) = 1.0D0/2.0D0
%        H(1,3) = 1.0D0/3.0D0
%        H(2,1) = 1.0D0/2.0D0
%        H(2,2) = 1.0D0/3.0D0
%        H(2,3) = 1.0D0/4.0D0
%        H(3,1) = 1.0D0/3.0D0
%        H(3,2) = 1.0D0/4.0D0
%        H(3,3) = 1.0D0/5.0D0
%
%   See also SYM/PRETTY, SYM/LATEX, SYM/CCODE.

%   Copyright 1993-2008 The MathWorks, Inc.

t = inputname(1);
ps = inputParser;
ps.addParamValue('file','',@ischar);
ps.parse(varargin{:});
opts = ps.Results;
if isempty(t), t = 'T'; end
if isscalar(struct(s)) && strcmp(class(s.s),'maplesym')
    f = fortran(s.s,t);
else
    mupadeval([t ':=' charcmd(s) ';']);
    if ~isempty(opts.file)
        generateCode(t,'fortran',opts);
    else        
        f = sprintf(char(mupadfeval('generate::fortran', t)));
        f(f == '"') = [];
    end
    mupadeval(['delete ' t]);
end
