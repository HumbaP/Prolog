dentro(irina,natasha).
dentro(natasha, olga).
dentro(olga, katarina).

contenida(X,Y):- dentro(X,Y).
contenida(X,Y):- dentro(X,Z), contenida(Z,Y).

