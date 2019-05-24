function M = charcmd(A)
%CHARCMD   Convert scalar or array sym to string command form
%   CHARCMD(A) converts A to its string representation for sending commands
%   to the symbolic engine.

%   Copyright 2008 The MathWorks, Inc.

if all(size(A) == 1)
    % Scalar
    M = lvarname(A.s);

elseif any(size(A) == 0)
    M = '[]';

else
    % Array
    d = ndims(A);
    n = numel(A);
    switch d
      case {1, 2}
            % Extract matrix elements into a cell array
            c = cell(size(A));
            for k=1:n
                c{k} = lvarname(A(k).s);
            end
            c = c.';
            % Construct the format string for one row
            fs = [repmat('%s,', 1, size(A, 2)-1) '%s],['];
            % Generate the text representation of the matrix elements
            S = sprintf(fs, c{:});
            % Construct the matrix
            M = ['matrix([[', S(1:end-3),']])'];

        otherwise
            z = size(A);
            if length(A) < 3
                z(3) = 1;
            end
            Mbegin = ['array(' sprintf('1..%d,',z)];

            v = cumprod([1 z(1:end-1)]);
            c = cell(1, n);
            for k = 0:n-1
                is = mod(floor(k./v),z)+1;
                cis = sprintf('%d,', is);
                c{k+1} = ['(' cis(1:end-1) ')=' lvarname(A(k+1).s) ','];
            end
            Mend = ')';
            M = [Mbegin c{1:n-1} c{n}(1:end-1) Mend];
            
    end
end

function s = lvarname(x)
if isa(x,'mupadsym')
    s = varname(x);
else
    s = char(x);
end