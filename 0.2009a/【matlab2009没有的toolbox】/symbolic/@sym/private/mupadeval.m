function [result,status] = mupadeval(statement)
%MUPADEVAL String access to the MuPAD kernel.
%   MUPADEVAL(STATEMENT) sends STATEMENT to the MuPAD kernel. 
%   STATEMENT is a string representing a syntactically valid MuPAD 
%   command. A semicolon for the MuPAD syntax is appended to STATEMENT
%   if necessary. The result is a string in MuPAD syntax.
%
%   [RESULT,STATUS] = MUPADEVAL(...) returns the warning/error status.
%   When the statement execution is successful, RESULT is the result
%   and STATUS is 0. If the execution fails, RESULT is the corresponding 
%   warning/error message, and STATUS is a positive integer.
%
%   See also SYM

%   Copyright 2008 The MathWorks, Inc.

    if nargout < 2
        result = evalin(symengine,statement,'char');
    else
        [result,status] = evalin(symengine,statement,'char');
    end
    
