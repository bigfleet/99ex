-module (one).
-export ([mylast/1]).
% (*) Find the last box of a list.
%     Example:
%     * (my-last '(a b c d))
%     (D)

% In Erlang, the appropriate list syntax uses braces.
% [{apples,10},{pears,6},{milk,3}].

% My first attempt looked like this:
% mylast (H, T)  -> mylast(T);
% mylast (H)     -> H.

% I adapted this from a copy / paste.  It didn't terminate.
% mylast(L) -> mylast(0, L).
% 
% mylast(N, []) -> N; 
% mylast(H, T) -> mylast(T).

% I finally dug around enough and got this to work!

mylast ([H|T]) when T=:=[] -> H;
mylast ([H|T]) -> mylast(T).
 
% Key observations:
% [] is the empty list
% Guard operators are powerful
% =:= is preferred over == for some reason.  = is still assignment

% Questions:
% variable 'H' is unused-- who cares?
