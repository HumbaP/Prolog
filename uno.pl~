%Modelo
%Colores de cartas

% S=Salto r=Reversa c2=Come 2,comodin4=Comodin+4,
% v=verde,a=azul,r=rojo,am=amarillo
cartas([[1,v],[2,v],[3,v],[4,v],[5,v],[6,v],[7,v],[8,v],[9,v],[s,v],[r,v],[c2,v],
       [1,a],[2,a],[3,a],[4,a],[5,a],[6,a],[7,a],[8,a],[9,a],[s,a],[r,a],[c2,a],
       [1,r],[2,r],[3,r],[4,r],[5,r],[6,r],[7,r],[8,r],[9,r],[s,r],[r,r],[c2,r],
       [1,am],[2,am],[3,am],[4,am],[5,am],[6,am],[7,am],[8,am],[9,am],[s,am],[r,am],[c2,am],
       [comodin,todo],[comodin,todo],[comodin,todo],[comodin,todo],
       [comodin4,todo],[comodin4,todo],[comodin4,todo],[comodin4,todo]]).

repartir(L,P,N,LR,PR):-N == 1,
    length(L,T),T2 is T-1,
    random_between(0,T2,R),
    nth0(R,L,E,LR),
    append([E],P,PR).
%Se puede usar tambien para comer cartas
repartir(L,P,N,LR,PR):-N>1,N2 is N-1,
    repartir(L,P,N2,LR1,PR1),
    length(LR1,T),T2 is T-1,
    random_between(0,T2,R),
    nth0(R,LR1,E,LR),
    append([E],PR1,PR).

juego(P1,P2,M):-cartas(L),repartir(L,[],7,LR,P1), repartir(LR,[],7,LR1,P2),
    repartir(LR1,[],1,_,M).

%Metodo para tirar cartas
tirarCarta(P,M,C):-nth0(1,C,ColorC ),nth0(1,C,NumeroC),nth0(0,M,CartaM),nth0(1,CartaM,ColorM),nth0(1,CartaM,NumeroM ),(ColorC\=todo,((ColorC==ColorM, nth0(_,P,C,P));(NumeroC==NumeroM,select(C,P,M))));(ColorC==todo,select(C,P,M)).
%Entra solo cuando es un comodin

juego2(P1,P2,M):-cartas(L),repartir(L,[],7,LR,P1), repartir(LR,[],7,LR1,P2),
    repartir(LR1,[],1,_,M).


/*elimina(X,[X|T],T).
elimina(X,[Y|L],[Y|R]):- elimina(X,L,R).

enesimo(_,[],[]).
enesimo(1,[X|_],X).
enesimo(N,[_|L],X):-N>1, N1 is N-1, enesimo(N1,L,X).

inserta(X,[],[X|[]]).
inserta(X,Z,[X|Z]).

darCarta(J,L,LR,JR):-length(L,T),random_between(1,T,N), enesimo(N,L,E), inserta(E,J,JR), elimina(E,L,LR).

darCartas(J,L,N):- N>0, N2 is N-1, darCarta(J,L,LR,JR), darCartas(JR,LR,N2), write(JR).

juego(P1,P2,P3,P4,L):-cartas(L),
    darCarta(P1,L,LR,P1R),
    darCarta(P2,LR,LR2,P2R),
    darCarta(P3,LR2,LR3,P3R),
    darCarta(P4,LR3,LR4,P4R).

prueba(L,E):-retract(L).

*/
/*color(verde).
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
especialU(comodin4).*/
%Especial Unica (sin color)

/*carta([X,Y]):- numero(X), color(Y), Y\=todo.
carta([X,Y]):- (especial(X), color(Y), Y\=todo); (especialU(X),color(Y), Y==todo).
inserta(X,[],[X|[]]).
inserta(X,Z,[X|Z]).
% create(L,Cont):- Cont>0, Cont2 is Cont-1, carta(L2), inserta(L2,L,L),
% create(L,Cont2).
genera(_).
genera(L):- carta(X), inserta(X,L2,L), genera(L2).
create(L,Cont):- Cont>0, Cont2 is Cont-1, genera(L).
%Error en esta parte, se va al infinito
createDeck(Z):- carta(L), append(Z,L,R), createDeck(R).*/

/*carta([X,Y]):- numero(X), color(Y), Y\=todo.
carta([X,Y]):- especial(X), color(Y), Y\=todo.
cartaEspecial([X,Y]):- especialU(X), color(Y), Y == todo.
diferentes(_,[]).
diferentes(E,[E2|L]):- E\=E2, diferentes(E,L).
genera2(L,LR):-carta(E), diferentes(E,LR), append(E,L,LR), genera2().
genera(L):- carta(E), append(E,[],LR), genera2(LR,L).
*/
