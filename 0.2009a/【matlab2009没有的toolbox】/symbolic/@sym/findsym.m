function v = findsym(S,n)
%FINDSYM Finds the symbolic variables in a symbolic expression or matrix.
%   FINDSYM(S), where S is a scalar or matrix sym, returns a string 
%   containing all of the symbolic variables appearing in S. The 
%   variables are returned in lexicographical order and are separated by
%   commas. If no symbolic variables are found, FINDSYM returns the
%   empty string.  The constants pi, i and j are not considered variables.
%
%   FINDSYM(S,N) returns the N symbolic variables closest to 'x' or 'X'. 
%   Upper-case variables are returned ahead of lower-case variables.
%
%   Examples:
%      findsym(alpha+a+b) returns
%       a, alpha, b
%
%      findsym(cos(alpha)*b*x1 + 14*y,2) returns
%       x1,y
%
%      findsym(y*(4+3*i) + 6*j) returns
%       y

%   Copyright 1993-2008 The MathWorks, Inc.

% Convert array to scalar.

if isscalar(struct(S)) && strcmp(class(S.s),'maplesym')
    if nargin == 2
        v = findsym(S.s,n);
    else
        v = findsym(S.s);
    end
    if isa(v,'maplesym')
        v = sym(v);
    end
else

    % Get the sorted list of all symbolic variables
    v = mupadfeval('mlindets', S, nargin ~= 1);

    % Return empty string if no symbolic variables found
    if isempty(v)
        v = '';
        return;
    end;

    if nargin == 1 || length(v) < n
        n = length(v);
    end
    v = char(v(1:n));
    if n > 1
        v = v(10:end-3);
    end
end
