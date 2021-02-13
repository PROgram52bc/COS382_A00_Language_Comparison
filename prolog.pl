% prolog

:- initialization(main).

main :-
	write("Enter a number:"),
	read(Num),
	loop_result(Num),
	halt.

range(Start, End, Start) :- Start < End.
range(Start, End, Out) :-
	Start < End,
	Next is Start + 1,
	range(Next, End, Out).

divides(Dividend, Divisor) :-
	Dividend / Divisor =:= Dividend // Divisor.

% Whether Num can be divided by any number without remainder from Lower to Upper-1.
no_divisor(_, Lower, Upper) :- Lower >= Upper.
no_divisor(Num, Lower, Upper) :-
	\+ (divides(Num, Lower)),
	Next is Lower + 1,
	no_divisor(Num, Next, Upper).

% Checks whether a number N is a prime
% FIXME: when bound the third parameter of no_divisor to sqrt(N), the following query behaves strangely:
% ?- range(2,100,N), prime(N).
prime(N) :-
	N > 1, % make sure N is not less than 2
	N =:= floor(N), % make sure is an integer
	no_divisor(N, 2, N).

prime_partition(0, _, []).
prime_partition(N, K, [P|L]) :-
	N > K,
	Next is K+1,
	range(Next, N+1, P), 
	prime(P),
	N0 is N-P,
	prime_partition(N0, P, L).

write_add_str([N]) :-
	write(N), nl.
write_add_str([N|L]) :-
	format("~d + ", [N]),
	write_add_str(L).

loop_result(N) :-
	forall(prime_partition(N, 1, Result), write_add_str(Result)).
