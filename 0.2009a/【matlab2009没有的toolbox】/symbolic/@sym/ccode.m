function c = ccode(s,varargin)
%CCODE  C code representation of a symbolic expression.
%   CCODE(S) returns a fragment of C that evaluates the symbolic expression S.
%   CCODE(S,'file',FILE) writes an optimized code fragment to file FILE.
%
%   Examples:
%      syms x
%      f = taylor(log(1+x));
%      ccode(f) =
%
%        t0 = x-(x*x)*(1.0/2.0)+(x*x*x)*(1.0/3.0)-(x*x*x*x)*(1.0/4.0)+(x*x*x*x*x)*(1.0/5.0);
%
%      H = sym(hilb(3));
%      ccode(H) =
%
%       H[0][0] = 1.0;
%       H[0][1] = 1.0/2.0;
%       H[0][2] = 1.0/3.0;
%       H[1][0] = 1.0/2.0;
%       H[1][1] = 1.0/3.0;
%       H[1][2] = 1.0/4.0;
%       H[2][0] = 1.0/3.0;
%       H[2][1] = 1.0/4.0;
%       H[2][2] = 1.0/5.0;
%
%   See also SYM/PRETTY, SYM/LATEX, SYM/FORTRAN.

%   Copyright 1993-2008 The MathWorks, Inc.

t = inputname(1);
ps = inputParser;
ps.addParamValue('file','',@ischar);
ps.parse(varargin{:});
opts = ps.Results;
if isempty(t), t = 'T'; end
if isscalar(struct(s)) && strcmp(class(s.s),'maplesym')
    c = ccode(s.s,t);
else
    mupadeval([t ':=' charcmd(s) ';']);
    if ~isempty(opts.file)
        generateCode(t,'C',opts);
    else        
        c = sprintf(char(mupadfeval('generate::C', t)));
        c(c == '"') = [];
    end
    mupadeval(['delete ' t]);
end

