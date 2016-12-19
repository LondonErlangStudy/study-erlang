-module(foo).
-export([square/1, add/2, fact1/1, fact/1, mynot/1, even/1]).

square(X) ->
    X * X.

add(A,B) ->
    A + B.

%fact(N) when N < 2 -> N;

fact1(N) ->
    if 
	N < 3 -> N;
	true  -> N * fact1(N-1)
    end.


fact(N) when N =< 2 -> N;
fact(N) -> N * fact(N-1).

mynot(true) -> false;
mynot(false) -> true.

even(0) ->
    true;
even(1) ->
    false;
even(2) ->
    true;
even(3) ->
    false;
even(N) ->
    not(even(N-1)).

