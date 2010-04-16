-module (two).
-export ([mybutlast/1]).

% (*) Find the last but one box of a list.
%    Example:
%    * (my-but-last '(a b c d))
%    (C D)

% This adaptation got me close, but doesn't drop the first bits.
% 15> two:mybutlast([1,2,3,4]).
% [1,[2,[3,4]]]

% mybutlast ([H|T]) when T=:=[] -> H;
% mybutlast ([H|T]) -> [H, mybutlast(T)].

% This works, but is it cheating?

mybutlast ([H|T]) when length(T)=:=2 -> T;
mybutlast ([H|T]) -> mybutlast(T).

% Key questions:

% What would the preferred solution look like?
