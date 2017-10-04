
%Modelo
%Colores de cartas

color(verde).
color(azul).
color(rojo).
color(amarillo).
color(todo).
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).
numero(6).
numero(7).
numero(8).
numero(9).

%S=Salto r=Reversa c2=Come 2,comodin4= Comodin+4
especial(s).
especial(r).
especial(c2).
especialU(comodin).
especialU(comodin4).
%Especial Unica (sin color)

carta([X,Y]):- numero(X), color(Y), Y\=todo.
carta([X,Y]):- (especial(X), color(Y), Y\=todo); (especialU(X),color(Y), Y==todo).


%Error en esta parte, se va al infinito
createDeck(Z):- carta(L), append(Z,L,R), createDeck(R).
