-module(foo).
-export([square/1, add/2, fact1/1, fact/1, mynot/1, even/1, evil/1, odd/1]).

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
even(N) ->
    odd(N-1).

odd(0) ->
    false;
odd(N) ->
    even(N-1).



evil(N) ->
    abs(N) rem 2 == 0.
