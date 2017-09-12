%Ejercicio 1.
%Parte 1.
mitad_Veneno(violeta, azul).
mitad_Veneno(rojo, amarillo).
mitad_Veneno(azul, anaranjado).
%Parte 2.
uno_Limpio(violeta, amarillo).
uno_Limpio(rojo, anaranjado).
uno_Limpio(verde, azul).

no_Veneno(rojo).

no_Veneno(X) :-	(uno_Limpio(X,Y) ; uno_Limpio(Y,X)), veneno(Y).
no_Veneno(X) :-	uno_Limpio(X,Y), uno_Limpio(Y,X).
veneno(X) :- (mitad_Veneno(X,Y); mitad_Veneno(Y,X)), no_Veneno(Y) .
