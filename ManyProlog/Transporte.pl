enCarro(newYork,hamilton).
enCarro(hamilton,francia).
enCarro(valmont,roma).
enCarro(valmont,metz).
enTren(metz,frankfurt).
enTren(roma,frankfurt).
enTren(metz,paris).
enTren(roma,paris).
enAvion(frankfurt,bangkok).
enAvion(frankfurt,singapore).
enAvion(paris,losAngeles).
enAvion(bangkok,newYork).
enAvion(singapore,newYork).
enAvion(losAngeles,newYork).


connected(X,Y) :- enCarro(X,Y);enTren(X,Y);enAvion(X,Y).
%viaje(X, Y):- connected(X,Y);(connected(X,Z), viaje(Z,Y)).

%viaje(X,Y, go(X,Z)):- connected(X,Y);(connected(X,Z), viaje(Z,Y)).

transporte(X,Y,enCarro) :- enCarro(X,Y).
transporte(X,Y,enTren) :- enTren(X,Y).
transporte(X,Y,enAvion):-enAvion(X,Y).

viaje(X,Y,Z):- transporte(X,Y,Z).
/*viaje(X,Y,go(X,Y,trans)):- connected(X,Y), transporte(X,Y,trans).
viaje(X,Y,go(X,Z,trans)):- connected(X,Z), transporte(X,Z,trans),
viaje(Z,Y, trans).*/
