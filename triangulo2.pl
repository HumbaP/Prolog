trianBase([[5,7,1], [3,8,2], [2,2,9], [1,5,3], [7,6,4], [4,9,9]]).
trianRoof([[9,8,4], [5,6,1], [8,7,3]]).

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