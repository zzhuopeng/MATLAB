classdef mupadsym < handle
%MUPADSYM Internal representation of a MuPAD result to sym commands

%   Copyright 2008 The MathWorks, Inc.

properties % (SetAccess='private')
        ref = '';  % reference string
    end
    methods
        function y = mupadsym(arg)
            if nargin == 0
                return;
            end
            y.ref = arg;
        end

        function delete(h)
            if ~isempty(h) && ~isempty(h.ref)
                mupadmex(h.ref,6);
            end
        end

        function s = varname(x)
            % return the name of the reference as a string
            s = x.ref;
        end

        function s = char(x)
            % return the value of the reference as a string
            s = evalin(symengine,x.ref,'char');
            s = strrep(s,'MLVar','');
        end
    end
end
