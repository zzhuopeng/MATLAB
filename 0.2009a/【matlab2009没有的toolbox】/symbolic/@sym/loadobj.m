function y = loadobj(x)
%LOADOBJ    Load symbolic object
%   Y = LOADOBJ(X) is called when loading symbolic objects
    
%   Copyright 2008 The MathWorks, Inc.
    
    eng = symengine;
    if strcmp(eng.kind,'maple')
        y = sym(maplesym(struct(x)));
    else 
        y = x;
    end
