-module (twelve).
-export ([decode_rle/1, test/0]).
-import (lists, [append/2]).
-import (lists, [duplicate/2]).
-import (lists, [flatten/1]).

%  Decode a run-length encoded list.Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

test() ->
  [a, a, a,b, b, b] = twelve:decode_rle([[3,a],[3,b]]),
  [a,a,a,a,b,c,c,a,a,d,e,e,e,e] = twelve:decode_rle([[4,a],b,[2,c],[2,a],d,[4,e]]),
  ok.

decode_rle(Data) ->
  decode_rle(Data, []).

decode_rle([], Accum) -> Accum;
decode_rle([H|T], Accum) when is_atom(H) -> 
	decode_rle(T, append(Accum, H));
decode_rle([H|T], Accum) -> 
	decode_rle(T, append(Accum, 
		flatten(duplicate(hd(H), tl(H))))).
