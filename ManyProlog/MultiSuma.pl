multiplicacion(0,0).
multiplicacion(X,N,R):-N > 0, R is X + X,N1 is N-1, multiplicacion(X,N1, R2),R is R+R2.
