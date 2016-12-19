-module(foo).
-export([square/1, add/2, fact1/1, fact/1, mynot/1, even/1, evil/1, odd/1, filt/1, filteven/1, filt/2]).

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


% filteven([1,3,4,6,8,9])
% [4,6,8]

filteven([]) ->
    [];
filteven([H|T]) ->
    case even(H) of
	true -> [H|filteven(T)];
	false -> filteven(T)
    end.


filt(X) ->
    square(X).

filt([], _) ->
    [];
filt([H|T], F) ->
    case F(H) of
	true -> [H|filt(T,F)];
	false -> filt(T,F)
    end.

%47> foo:filt([1,3,4,6,8,9], fun foo:even/1).
%[4,6,8]
%48> foo:filt([1,3,4,6,8,9], fun foo:odd/1). 
%[1,3,9]

evil(N) ->
    abs(N) rem 2 == 0.
