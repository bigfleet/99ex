-module (nine).
-export ([mypack/1, test/0]).

% Pack consecutive duplicates of list elements into sublists.
%     If a list contains repeated elements they should be placed in separate sublists.
% 
%     Example:
%     * (pack '(a a a a b c c a a d e e e e))
%     ((A A A A) (B) (C C) (A A) (D) (E E E E))

mypack(Data) ->
  mypack(Data, []).

test() ->
  [[a, a, a], [b, b, b]] = nine:mypack([a,a,a,b,b,b]),
  [[a,a,a,a], [b], [c, c], [a, a], [d], [e, e, e, e]] = nine:mypack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
  ok.


% mypack ([H|T]) when T =:= [] -> [H];
% mypack ([H|T]) when H =:= hd(T) -> [H | mypack(T)];
% mypack ([H|T]) -> [[H] , mypack(T)];
% mypack ([]) -> [].

% When there are no more items to pack, reverse the list since we've been working from the end backward.
mypack([], Accum) ->
  lists:reverse(Accum);
% Runs once at start: Create a list containing of one item (the previous list head), place that in the accumulator, and pack the rest.
mypack([H|T], []) ->
  mypack(T, [[H]]);
% Main case:
%   acquire the first item of the head of the list
%   acquire the first item of the accumulator
%   does the first item belong in the list?
%     if so, add the previous head to the list in the accumulator
%     if not, create a list of one item, and append it to the existing accumulator
%   continue
mypack([H|T], [AH|AT]=Accum) ->
  case lists:member(H, AH) of
    true ->
      mypack(T, [[H|AH]|AT]);
    false ->
      mypack(T, [[H]|Accum])
  end.

% 62> nine:mypack([a, a, a, a, a, b, c, c, a, a, d, e, e, e, e]).
% [a,a,a,a,[a],[[b],[c,[c],[a,[a],[[d],[e,e,e,e]]]]]]
% -module(packer).
% 
% 
% pack(Data) ->
%   pack(Data, []).
% 
% test() ->
%   [[a, a, a], [b, b, b]] = packer:pack([a,a,a,b,b,b]),
%   [[a,a,a,a], [b], [c, c], [a, a], [d], [e, e, e, e]] = packer:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
%   ok.
% 
% %% Internal functions
% pack([], Accum) ->
%   lists:reverse(Accum);
% pack([H|T], []) ->
%   pack(T, [[H]]);
% pack([H|T], [AH|AT]=Accum) ->
%   case lists:member(H, AH) of
%     true ->
%       pack(T, [[H|AH]|AT]);
%     false ->
%       pack(T, [[H]|Accum])
%   end.