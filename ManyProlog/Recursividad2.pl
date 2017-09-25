perros(pastorAleman, [solvino, dino, oso, hitler]).
perros(sanBernardo, [riky, bella, majestad]).
perros(frenchPoodle, [paloma, piojo, liver]).

pertenece(E,L) :- L = [E|_].
pertenece(E,[_|T]) :- pertenece(E,T).

pastorAleman(P) :- perros(pastorAleman, L), pertenece(P,L).

raza(R) :- perros(_,L), pertenece(R,L).


%Concatenar 2 cadenas.

concatena([],L,L).
concatena([X|L1], L2, [X|L3]) :- concatena(L1, L2, L3).
%member1(X,L) :- concatena(L1,[X|L2], L).

imprime(Num) :- write(*),Num>1,imprime(Num-1).
bars([]).
bars([X|L]):- imprime(X);(nl, bars(L)).


