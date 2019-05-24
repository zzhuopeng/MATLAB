function disp(X)
%DISP   Displays a sym as text.
%   DISP(S) displays the scalar or array sym,
%   without printing the sym name.

%   Copyright 1993-2008 The MathWorks, Inc.

if isscalar(struct(X)) && strcmp(class(X.s),'maplesym')
    disp(X.s,inputname(1));
    return;
end

loose = isequal(get(0,'FormatSpacing'),'loose');
if isempty(X) 
   disp('[ empty sym ]')
elseif all(size(X) == 1)
   s = char(X);
   s(s=='`') = [];
   disp(s)
else
   % Find maximum string length of the elements of a X
   p = size(X);
   d = ndims(X);
   strs = cell(p);
   lengths = zeros(p);
   for k = 1:numel(X)
       strs{k} = char(X(k));
       lengths(k) = length(strs{k});
   end;
   while ndims(lengths) > 2
       lengths = max(lengths,[],ndims(lengths));
   end
   len = max(lengths,[],1);

   for k = 1:prod(p(3:end))
      if d > 2
         if loose, disp(' '), end
         disp([inputname(1) '(:,:,' int2strnd(k,p(3:end)) ') = '])
         if loose, disp(' '), end
      end
      % Pad each element with the appropriate number of blanks
      for i = 1:p(1)
         str = '[';
         for j = 1:p(2)
            s = strs{i,j,k};
            s(s=='`') = [];
            str = [str blanks(len(j)-length(s)+1) s ','];
         end
         str(end) = ']';
         if p(2) == 1; str = str(2:end-1); end
         disp(str)
      end
   end
end
if loose, disp(' '), end
collectGarbage(symengine);

% ------------------------

function s = int2strnd(k,p)
s = '';
k = k-1;
for j = 1:length(p)
   d = mod(k,p(j));
   s = [s int2str(d+1) ','];
   k = (k - d)/p(j);
end
s(end) = [];
