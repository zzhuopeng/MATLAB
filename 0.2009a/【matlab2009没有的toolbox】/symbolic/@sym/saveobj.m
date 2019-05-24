function y = saveobj(x)
%SAVEOBJ    Save symbolic object
%   Y = SAVEOBJ(X) converts symbolic object X into a form that can be
%   saved to disk safely.
    
%   Copyright 2008 The MathWorks, Inc.

    y = x;
    if isscalar(struct(x)) && strcmp(class(x.s),'maplesym')
        y.s = char(y.s);
    else
        for k=1:numel(y)
            y(k).s = char(y(k));
        end
    end
