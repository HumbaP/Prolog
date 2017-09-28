fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,X):- N>1, N1 is N-1,write(N),nl, fibonacci(N1,X1),
	N2 is N-2, fibonacci(N2,X2), X is X1+X2.

stack(N):-N>0, write(N), nl,N1 is N+1, stack(N1).
