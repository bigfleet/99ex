-module (ten).
-export ([rle/1, test/0]).
-import (nine, [mypack/1]).
-import (lists, [append/2]).
% P10 (*) Run-length encoding of a list.Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
% Example:
% * (encode '(a a a a b c c a a d e e e e))
% ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))
% 


test() ->
  [[3,a],[3,b]] = ten:rle([a, a, a,b, b, b]),
  [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]] = ten:rle([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
  ok.

rle(Data) ->
  rle(nine:mypack(Data), []).

rle([], Accum) ->
  Accum;
rle([H|T], []) ->
  rle(T, [[length(H), hd(H)]]);
rle([H|T], Accum) ->
  rle(T, lists:append(Accum, [[length(H), hd(H)]])).
