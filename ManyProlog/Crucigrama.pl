palabra(zapato,z,a,p,a,t,o).
palabra(apio,a,p,i,o).
palabra(pate,p,a,t,e).
palabra(este,e,s,t,e).
palabra(osa,o,s,a).

solucion(V1,V2,H1,H2,H3):- palabra(V1,_,_,A,_,B,C),
	palabra(V2,D,E,_,_), palabra(H1,_,A,_,_),
	palabra(H2,_,_,B,D), palabra(H3,C,E,_).

/*solucion([V1,V2,H1,H2,H3]):- palabra(V1,_,_,A,_,B,C),
	palabra(V2,D,E,_,_), palabra(H1,_,A,_,_),
	palabra(H2,_,_,B,D), palabra(H3,C,E,_).*/
