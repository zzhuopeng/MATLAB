function generateCode(t,lang,opts)
%generateCode Generate code for sym expression
%   generateCode(t,lang,opts) generates code for lang for the expression
%   with name t and options opts.
    
%   Copyright 2008 The MathWorks, Inc.

    if nargout > 0
        error('symbolic:generateCode:NoOutput',...
              'Cannot specify a file name and output variable together.');
    end
    gent = feval(symengine,'mloptimize',t);
    file = opts.file;
    [fid,msg] = fopen(file,'wt');
    if fid == -1
        error('symbolic:sym:ccode:FileError',...
              'Could not create file %s: %s',file,msg);
    end
    tmp = onCleanup(@()fclose(fid));
    for k = 1:length(gent)
        tk = mupadfeval(['generate::' lang], gent(k));
        str = strtrim(sprintf(char(tk)));
        str(str == '"') = [];
        fprintf(fid,'%s',str);
    end
