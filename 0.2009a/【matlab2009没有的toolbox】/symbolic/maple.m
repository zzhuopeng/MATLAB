function [result,status] = maple(varargin)
%MAPLE String access to the Maple kernel if installed.
%   MAPLE(STATEMENT) sends STATEMENT to the Maple kernel if it is installed. 
%   STATEMENT is a string representing a syntactically valid Maple 
%   command. A semicolon for the Maple syntax is appended to STATEMENT
%   if necessary. The result is a string in Maple syntax.
%
%   MAPLE('function',ARG1,ARG2,..,) accepts the quoted name of any Maple
%   function and its corresponding arguments. The Maple statement is formed
%   as: function(arg1, arg2, arg3, ...), that is, commas are added between
%   the arguments. All of the input arguments must be strings that are
%   syntactically valid in Maple. The result is returned as a string in the 
%   Maple syntax.  To convert the result from a Maple string to a symbolic
%   object, use SYM.
%
%   [RESULT,STATUS] = MAPLE(...) returns the warning/error status.
%   When the statement execution is successful, RESULT is the result
%   and STATUS is 0. If the execution fails, RESULT is the corresponding 
%   warning/error message, and STATUS is a positive integer.
%
%   The statements
%      maple traceon  or  maple trace on
%   cause subsequent Maple commands and results to be printed.
%   The statements
%      maple traceoff  or  maple trace off
%   turn off this facility.
%   The statement
%      maple restart
%   clears the Maple workspace and reinitializes the Maple kernel.
%
%   See also SYM, SYM/MAPLE

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.38.4.5.2.1 $  $Date: 2008/07/17 04:41:05 $

eng = symengine;
if strcmp(eng.kind,'maple')
    for k = 1:nargin
        if isa(varargin{k},'sym')
            v = struct(varargin{k});
            varargin{k} = v.s;
        end
    end
    if nargout == 2
        [result,status] = mapleengine('eval',varargin{:});
    else
        result = mapleengine('eval',varargin{:});
    end
    if isa(result,'maplesym')
        result = sym(result);
    end
else
    error('symbolic:maple:NotInstalled','Maple engine is not installed.');
end
