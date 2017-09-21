%Cascarias
%Solo sabemos nombre y edad de niño
%Parejas, solo con alguien de la misma edad
nino(manuel,13).
nino(alejandro,12).
nino(daniel,11).
nino(heleodro,13).
nino(yaroslava,12).
nino(vladimir,9).

juega(X,Y):- nino(X,Z1), nino(Y,Z2), Z1==Z2, X\=Y.
%Ejercicio 2
%Mes y dia de nacimiento y regrese el signo
signo(aries,3,21,4,20).
signo(tauro,4,21,5,21).
signo(geminis,5,22,6,20).
signo(cancer,6,21,7,22).
signo(leo,7,23,8,18).
signo(virgo,8,19,9,21).
signo(libra,9,22,10,22).
signo(escorpion,10,23,11,22).
signo(sagitario,11,23,12,21).
signo(capricornio,12,22,1,20).
signo(acuario,1,21,2,18).
signo(piscis,2,19,3,20).
%X es mes, Y es fecha
%signo(X,Y,Z):- (signo(Z,F1,F2,F3,F4), X=F1,X=<F3, Y>=F2, Y=<F4).
miSigno(X,Y,Z):- (signo(Z,M1,D1,M2,D2), (X>=M1 , X=<M2, Y>=D1, Y=<D2)); (signo(Z,M1,D1,M2,D2),X>=M2 , X=<M1, Y>=D2, Y=<D1).
