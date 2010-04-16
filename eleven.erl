-module (eleven).
-export ([rle/1, test/0]).
-import (nine, [mypack/1]).

% P11 (*) Modified run-length encoding.Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
% Example:
% * (encode-modified '(a a a a b c c a a d e e e e))
% ((4 A) B (2 C) (2 A) D (4 E))

test() ->
  [[3,a],[3,b]] = eleven:rle([a, a, a,b, b, b]),
  [[4,a],b,[2,c],[2,a],d,[4,e]] = eleven:rle([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
  ok.

rle(Data) ->
  rle(nine:mypack(Data), []).

rle([], Accum) ->
  Accum;
rle([H|T], []) ->
  rle(T, [[length(H), hd(H)]]);
rle([H|T], Accum) when length(H) =:= 1 -> 
	rle(T, lists:append(Accum, H));
rle([H|T], Accum) ->
	rle(T, lists:append(Accum, [[length(H), hd(H)]])).