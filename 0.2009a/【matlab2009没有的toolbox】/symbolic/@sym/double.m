function X = double(S)
%DOUBLE Converts symbolic matrix to MATLAB double.
%   DOUBLE(S) converts the symbolic matrix S to a matrix of double
%   precision floating point numbers.  S must not contain any symbolic
%   variables, except 'eps'.
%
%   See also SYM, VPA.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(S)) && strcmp(class(S.s),'maplesym')
    X = double(S.s);
else
    if ~isempty(findstr('eps',char(S)))
        S = subs(S,'eps',eps);
    end
    siz = size(S);
    d = 0;
    for k = 1:prod(siz)
        c = ['(' char(S(k)) ')'];
        f = find(c<'0' | c>'9');
        d = max(d,max(diff(f)));
    end
    d = d + 32;
    cstr = char(vpa(S(:),d));
    dstr = mupadchar2mat(cstr);
    ValueOfS = str2num(dstr);
    if isempty(ValueOfS) && numel(S)>0
        error('symbolic:sym:double:cantconvert', ...
              sprintf('%s\n%s', 'DOUBLE cannot convert the input expression into a double array.',...
                      'If the input expression contains a symbolic variable, use the VPA function instead.'));
    end
    if ~isscalar(S)
        X = reshape(ValueOfS,siz);
    else
        X = ValueOfS;
    end
end

function r = mupadchar2mat(r)
% Deblank.
r(findstr(r,' ')) = [];
r = strrep(r,'RD_NINF','(-inf)');
r = strrep(r,'RD_INF','(inf)');
r = strrep(r,'infinity','(inf)');
% Remove matrix, vector, or array from the string.
r = strrep(r,'matrix([[','['); r = strrep(r,'array([[','[');
r = strrep(r,']])',']'); r = strrep(r,'])',']');
