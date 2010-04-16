-module (seven).
-export ([myflatten/1]).

% Example:
% * (my-flatten '(a (b (c d) e)))
% (A B C D E)

myflatten(L) -> lists:flatten(L).