-module(three).
-export([elementat/2]).
-import(lists).

% Find the K'th element of a list.
%     The first element in the list is number 1.
%     Example:
%     * (element-at '(a b c d e) 3)
%     C

% Tried this and it didn't work.  Getting to the point where I'm happy to reference the built-ins
% instead of rewriting them.

% nthfromend([H, T], N) when length(T)=:=N-1 -> H; 
% nthfromend([H, T], N) -> nthfromend(T, N).
% 
% 
% elementat(L, N) -> nthfromend(lists:reverse(L), N).

% Key questions

% Do I need to export things to be able to call them?
% Why can't I reference this helper function?

elementat(L, N) -> lists:nth(N, L).