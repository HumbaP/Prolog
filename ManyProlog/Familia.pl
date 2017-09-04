%Base de conocimiento.
%Hechos.
padre(pam,bob).
padre(tom,bob).
padre(tom,liz).
padre(bob,ann).
padre(bob,pat).
padre(pat,jim).
padre(liz,via).

%Reglas.
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y), dif(X,Y).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
abuelo(X,Y) :- hijo(Y,Z), padre(X,Y).
nieto(X,Y) :- abuelo(Y,X).
tio(X,Y) :- padre(Z,Y), hermano(X,Z).
sobrino(Y,X) :- tio(X,Y).
primo(X,Y) :- tio(Z,X), padre(Z,Y).








