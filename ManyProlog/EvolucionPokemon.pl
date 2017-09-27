evolucion(huevo, bulbasaur).
evolucion(bulbasaur, ivysaur).
evolucion(ivysaur, venusaur).

evoluciona(X,Y) :- evolucion(X,Y).
evoluciona(X,Y) :- evolucion(X,Z), evoluciona(Z,Y).
