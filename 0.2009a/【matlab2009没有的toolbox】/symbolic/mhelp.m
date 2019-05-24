function mhelp(topic)
%MHELP  Maple help.
%   MHELP topic prints Maple's help text for the topic.
%   MHELP('topic') does the same thing.
%
%   Example: 
%      mhelp gcd 

%   Copyright 1993-2008 The MathWorks, Inc. 
%   $Revision: 1.14.4.1.2.1 $  $Date: 2008/07/17 04:41:07 $

eng = symengine;
if strcmp(eng.kind,'maple')
    mapleengine('help',topic);
else
    error('symbolic:mhelp:NotInstalled','Maple engine is not installed.');
end
