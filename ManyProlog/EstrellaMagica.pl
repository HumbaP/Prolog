%cada una de las lineas de los triangulos, la suma de los puntos de los
% vertices de como resultado 26, y la suma de las puntas de 26.

% [[B,C,D,E],[H,I,J,K],[B,F,I,L],[E,G,J,L],[H,F,C,A],[A,D,G,K]] y
% Vertices=[A,B,H,L,K,E]

suma([],0).
suma([X|L],R):- suma(L,R1), R is X + R1 , R==26.
diferentes([]).
diferentes([X|L]):- not(member(X,L)), diferentes(L).%member busca en la lista el valor.
validos([]).
validos([X|L]):- X>0 , X<13, validos(L).
maplist(suma,[[B,C,D,E],[H,I,J,K],[B,F,I,L],[E,G,J,L],[H,F,C,A],[A,D,G,K]],suma([A,B,H,L,K,E])):- write('La estrella es correcta, incluso las puntas').
estrella([]):- write('ingrese 12 numeros entre 1 y 12').
estrella(L):- not(length(L,12)), write('La lista debe contener 12 elementos').
estrella([A,B,C,D,E,F,G,H,I,J,K,L]):- (not(validos([A,B,C,D,E,F,G,H,I,J,K,L])),
				       write('Los numeros no estan en rango'));
                 (not(diferentes([A,B,C,D,E,F,G,H,I,J,K,L]),
		 write('Se encuentran numeros repetidos'));
		 (maplist, write('La suma de los numeros no son validos')).

soluciones:-(randseq(12,12,[A,B,C,D,E,F,G,H,I,J,K,L]),
	    maplist(suma, ))
