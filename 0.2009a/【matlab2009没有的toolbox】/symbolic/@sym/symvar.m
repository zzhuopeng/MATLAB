function v = symvar(S,n)
%SYMVAR Finds the symbolic variables in a symbolic expression or matrix.
%    SYMVAR(S), where S is a scalar or matrix sym, returns a vector sym 
%    containing all of the symbolic variables appearing in S. The 
%    variables are returned in lexicographical order. If no symbolic variables
%    are found, SYMVAR returns the empty vector. 
%    The constants pi, i and j are not considered variables.
% 
%    SYMVAR(S,N) returns the N symbolic variables closest to 'x' or 'X'. 
%    Upper-case variables are returned ahead of lower-case variables.
% 
%    Examples:
%       symvar(alpha+a+b) returns
%        [a, alpha, b]
% 
%       symvar(cos(alpha)*b*x1 + 14*y,2) returns
%        [x1, y]
% 
%       symvar(y*(4+3*i) + 6*j) returns
%        y

%   Copyright 2008 The MathWorks, Inc.

if nargin == 1
    v = findsym(S);
else
    v = findsym(S,n);
end
% check for sym because Maple might return a sym - MuPAD will return strings
if ~isa(v,'sym')
    if any(v==',')
        v(v==' ') = [];
        vc = regexp(v,'\w+','match');
        v = sym(zeros(1,length(vc))); 
        for k=1:length(vc)
            v(k) = sym(vc{k});
        end
    else
        v = sym(v);
    end
end

