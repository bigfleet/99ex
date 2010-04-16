-module (eight).
-export ([mycompress/1]).

% Eliminate consecutive duplicates of list elements.
% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
% 
%  Example:
%  * eight:mycompress([a, a, a, a, b, c, c, a, a, d, e, e, e, e]).
%  (A B C A D E)

mycompress ([H|T]) when H =:= hd(T) -> mycompress(T);
mycompress ([H|T]) -> [H | mycompress(T)];
mycompress ([]) -> [].