
suma(N,Resultado):- N=<1, Resultado is 1.
suma(N,Resultado):- N>1,suma(N-1,ResultAux), Resultado is ResultAux+N.
