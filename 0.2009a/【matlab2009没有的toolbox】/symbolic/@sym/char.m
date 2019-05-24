function M = char(A,d)
%CHAR   Convert scalar or array sym to string.
%   CHAR(A,d) converts A to its string representation.
%   CHAR(A) for scalar A is simply A.s.
%   CHAR(A,1) has the form 'vector([...])'.
%   CHAR(A,2) has the form 'matrix([[...],[...]])'.
%   CHAR(A,d) for d >= 3 has the form
%      'array([1..m,1..n,1..p],[(1,1,1)=xxx,...,(m,n,p)=xxx])'
%   CHAR(A) uses d = ndims(A).

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(A)) && strcmp(class(A.s),'maplesym')
    M = char(A.s);
else
    if all(size(A) == 1)
        % Scalar
        M = char(A.s);
    
    elseif any(size(A) == 0)
        M = 'matrix([])';

    else
        % Array
        if nargin < 2
            d = ndims(A);
        end
        n = numel(A);
        switch d
          case 1
            % Extract vector elements into a cell array
            c = cell(1, n);
            for k = 0:n-1
                c{k+1} = char(A(k+1).s);
            end
            M = ['matrix([' sprintf('%s,', c{1:end-1}), c{end}, '])'];
            
          case 2
            % Extract matrix elements into a cell array
            if ndims(A) > 2
                warning('symbolic:char:reshapendarray', ...
                        ['Reshaping the %d-dimensional symbolic ', ...
                         'matrix input into a 2-dimensional\nsymbolic matrix ', ...
                         'for use with the matrix([[...],[...]]) form, ', ...
                         'preserving the\nnumber of columns.'], ndims(A));
                A = reshape(A(:), [], size(A, 2));
            end
            c = cell(size(A));
            for k=1:n
                c{k} = char(A(k).s);
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
                c{k+1} = ['(' cis(1:end-1) ')=' char(A(k+1).s) ','];
            end
            Mend = ')';
            M = [Mbegin c{1:n-1} c{n}(1:end-1) Mend];
            
        end
    end
end

M = strrep(M,'MLVar','');
