trianBase([[5,7,1], [3,8,2], [2,2,9], [1,5,3], [7,6,4], [4,9,9]]).
trianRoof([[9,8,4], [5,6,1], [8,7,3]]).

% N es el número que debe de dar la suma de las aristas de los triángulos conectados
% ResList es la lista resultante (solución).
%	TRIÁNGULO:
/*
		1
	   234
	  56789
*	Primer elemento M (modo: base|roof)
*	Segundo elemento I (Izquierda)
*	Tercer elemento D (Derecha)
*/

writeArray([]).
writeArray([H|B]) :- format('~w ', H), writeArray(B).

writeList([]).
writeList([H|B]):- writeArray(H), write('\n'), writeList(B).

printList(L) :-
    writeList(L).

cambia(LR,LE):- LE is LR.


add(L,Tam,LB,LC,LBR,LCR):- Tam>0, Tam2 is Tam-1,
	(E is Tam mod 2,E>0, select(T,LB,LR));
	(E is Tam mod 2,E==0, select(T,LC,LR)),
	append(T,L,LR2),vaciar(L), copy(LR2,L),
	add(L,Tam2,LB,LC).

gameDSEM3(N,ResList):-
	trianBase(BList),
	trianRoof(CList)
	.
resolve(_,[],[],_).
resolve(N,BList,CList,RList):-
	add(LL1,1,BList,CList,RBList,RCList), write(LL1)
.


game(N,ResList):-debug,
	trianBase(BList),
	trianRoof(CList),
	%---------TRIANGULO 3------------------------------------
	select(Trian1, BList, RBList),
	nth0(0, Trian1, B1),
	select(Trian3, CList, RCList),
	nth0(0, Trian3, C3),
	sumIsN(B1,C3,N),

	select(Trian2, RBList, RBList1),
	nth0(2, Trian2, D2),
	nth0(1, Trian3, I3),
	sumIsN(D2,I3,N),

	select(Trian4, RBList1, RBList2),
	nth0(1, Trian4, I2),
	nth0(2, Trian3, D3),
	sumIsN(D3,I2,N),
	%---------TRIANGULO 6------------------------------------
	select(Trian5, RBList2, RBList3),
	nth0(2, Trian5, D5),
	select(Trian6, RCList, RCList1),
	nth0(1, Trian6, I6),
	sumIsN(D5,I6,N),

	nth0(0, Trian2, B2),
	nth0(0, Trian6, C6),
	sumIsN(B2,C6,N),

	select(Trian7, RBList3, RBList4),
	nth0(1, Trian7, I7),
	nth0(2, Trian6, D6),
	sumIsN(D6,I7,N),
	%---------TRIANGULO 8------------------------------------
	select(Trian8, RCList1, _),
	nth0(0, Trian8, C8),
	nth0(0, Trian4, B4),
	sumIsN(C8,B4,N),

	select(Trian9, RBList4, _),
	nth0(2, Trian8, D8),
	nth0(1, Trian9, I9),
	sumIsN(D8,I9,N),
	%---------RESULTADO--------------------------------------
	append([Trian1], [Trian2], ResList0),
	append(ResList0, [Trian3], ResList1),
	append(ResList1, [Trian4], ResList2),
	append(ResList2, [Trian5], ResList3),
	append(ResList3, [Trian6], ResList4),
	append(ResList4, [Trian7], ResList5),
	append(ResList5, [Trian8], ResList6),
	append(ResList6, [Trian9], ResList),
	printList(ResList).


sumIsN(Num1, Num2, N):-
	Sum is Num1+Num2,
	N == Sum
	.
