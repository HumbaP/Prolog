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

darMano(P1,P2,M,LF):-cartas(L),repartir(L,[],7,LR,P1), repartir(LR,[],7,LR1,P2),
    repartir(LR1,[],1,LF,M).

compatible([_,T],_):- T == todo.
compatible(_,[_,T]):- T == todo.
compatible([_,T],[_,T]).
compatible([N,_],[N,_]).

%tirarCarta([],_,_).
tirarCarta([CJ|LJ],M,CM):-(compatible(CJ,M),append(CJ,[],CM));
                           tirarCarta(LJ,M,CM).

turno(P,M,_,PR,_,MR):- tirarCarta(P,M,MR),select(MR,P,PR).
turno(P,M,L,PR2,LR2,MR):- repartir(L,P,1,LR,PR),turno(PR,M,LR,PR2,LR2,MR).

salto([Tipo,_]):-Tipo == s.

come2([Tipo,_]):-Tipo == c2.

come4([Tipo,_]):-Tipo == comodin4.

gano([]).
jugar(P1,P2,M,L):-
	          ((salto(M));
		  (come2(M),repartir(L,P1,2,LR,P1R));
		  (come4(M),repartir(L,P1,4,LR,P1R));
	          turno(P1,M,L,P1R,LR,MR))
		  ,
	          ((gano(P1R),write('gano jugador 1'),write(P1R));
		  (salto(MR));
		  (come2(MR),repartir(LR,P2,2,LR2,P2R));
		  (come4(MR),repartir(LR,P2,4,LR2,P2R));
		  turno(P2,MR,LR,P2R,LR2,MR2))
		  ,
		  ((gano(P1R),nl,write(P2));
		  (gano(P2R),write(P1),nl,write('gano jugador 2'),write(P2R));
		  jugar(P1R,P2R,MR2,LR2)).

juego2(P1,P2,M):- darMano(P1,P2,M,L), jugar(P1,P2,M,L).
