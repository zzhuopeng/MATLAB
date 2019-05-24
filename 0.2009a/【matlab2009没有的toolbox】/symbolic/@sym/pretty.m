function pretty(X)
%PRETTY Pretty print a symbolic expression.
%   PRETTY(S) prints the symbolic expression S in a format that 
%   resembles type-set mathematics.
%
%   See also SYM/SUBEXPR, SYM/LATEX, SYM/CCODE.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    pretty(X.s);
else
    if ndims(X)==2
        S = charcmd(X);
    else
        S = charcmd(X,2);
    end
    mupadmex('on',5); % enable pretty-printing
    cw = get(0,'CommandWindowSize');
    width = max(cw(1),40);
    if isscalar(X)
        feval(symengine,'mlpretty',S,width);
    else
        for k=1:7
            res = evalc('feval(symengine,''mlpretty'',S,width);');
            if ~strncmp(res(2:end),'array(',6) &&  ...
                    ~strncmp(res(2:end),'  array(',8)
                break;
            end
            width = 2*width;
        end
        fprintf(1,'%s',res);
    end
    mupadmex('off',5); % disable pretty-printing
end
