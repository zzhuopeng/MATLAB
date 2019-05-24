function J = jacobian(F,x)
%JACOBIAN Jacobian matrix.
%   JACOBIAN(f,v) computes the Jacobian of the scalar or vector f 
%   with respect to the vector v. The (i,j)-th entry of the result
%   is df(i)/dv(j). Note that when f is scalar, the Jacobian of f
%   is the gradient of f. Also, note that scalar v is allowed, 
%   although this is just DIFF(f,v).
%
%   Example:
%       jacobian([x*y*z; y; x+z],[x y z])
%       jacobian(u*exp(v),[u;v])
%
%   See also SYM/DIFF.

%   Copyright 1993-2008 The MathWorks, Inc.

if nargin == 1
    x = symvar(F);
end
if isscalar(struct(F)) && strcmp(class(F.s),'maplesym')
    J = sym(jacobian(F.s,x.s));
else
    J = mupadfeval('mljacobian',F,x);
end

