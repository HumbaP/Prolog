% En un bosque del país de los duendes, viven 100 duendecillos. No todos son amigos de todos. Incluso puede que haya alguno que no tiene ningún amigo. Únicamente puede decirse que si un duendecillo es amigo de otro, éste también lo es de aquél (cosa normal, por otra parte).
% A estos duendecillos puede vérseles elegantemente ataviados con un bonito manto de doble vuelta. Por un lado es azul y por el otro rojo. Cada cual luce su manto con el color que le apetece. Pero hete aquí que el caprichoso rey de este país, que por cierto no utiliza ese manto, ha dictado un decreto según el cual los duendes habrán de hacer lo siguiente:
% Cada día, sucesivamente, un duende visitará a todos sus amigos (sólo a sus amigos). Tras ello, si el número de amigos que lucen el manto de color diferente al suyo es mayor que el de los que lo lucen del mismo color, el duendecillo habrá de dar la vuelta a su manto. Al día siguiente otro duende hará lo mismo, de modo que en 100 días todos los duendes habrán realizado una visita a sus amigos. Cumplidos estos 100 días, las rondas de visitas comienzan de nuevo por el primer duendecillo que las inició.
% El rey ha decidido que las rondas de visitas continúen hasta que:
% a) Todos los duendecillos acaben con el manto del mismo color, o...
% b) Ninguno de los duendecillos haya de dar vuelta a su manto, porque no sean ya mayoría los amigos que lo lucen de color diferente.
% ¿Acabarán todos los duendecillos luciendo sus mantos del mismo color?
% ¿Están condenados eternamente a realizar las rondas de visitas ordenadas por el caprichoso rey?.
% En este cuento-problema, asumes el papel del malvado rey: deberás conseguir someter a los duendecillos al maximo número de rondas posible

% Un duende es igual a [nombre(o id en este caso), color de capa (rojo o azul), lista de amigos]

% Ver si un duende es amigo de otro.

:-dynamic 
    duende/3.
duende(1,rojo,  [2,5,7,8]).
duende(2,rojo,  [1,3,5,6,10]).
duende(3,azul,  [2,6,7,8]).
duende(4,azul,  [5,7,8]).
duende(5,rojo,  [1,2,4,7,8]).
duende(6,azul,  [3,7,12]).
duende(7,rojo,  [1,3,4,5,6,8,10,11]).
duende(8,rojo,  [1,3,4,5,7]).
duende(9,rojo,  []).
duende(10,rojo, [2,7]).
duende(11,rojo, [7]).
duende(12,azul, [6]).
duende(13,rojo, []).

duendes([[1,rojo,  [2,5,7,8]],
        [2,rojo,  [1,3,5,6,10]],
        [3,azul,  [2,6,7,8]],
        [4,azul,  [5,7,8]],
        [5,rojo,  [1,2,4,7,8]],
        [6,azul,  [3,7,12]],
        [7,rojo,  [1,3,4,5,6,8,10,11]],
        [8,rojo,  [1,3,4,5,7]],
        [9,rojo,  []],
        [10,rojo, [2,7]],
        [11,rojo, [7]],
        [12,azul, [6]],
        [13,rojo, []]
]).

% esAmigo([X,_,Z1],[Y,_,Z2]):- member(X,Z2), member(Y,Z1). 
% Cambiar el color de la capa del duende X es el nombre del duende
% cambiarCapa(X):- duende(X,C,Friends), Duende = [X,C,Friends], write(Duende),retract(duende(X,C,Friends)), (C==azul, assertz(duende(X,rojo,Friends));(C\=azul,assertz(duende(X,azul,Friends)))).
cambiarCapa(DList, Id, NDList):- nth0(Index,DList,[Id,_,_]), nth0(Index,DList,[Id,Color,Friends]),
                                 ((Color==azul, replace([Id,Color,Friends],[Id,rojo,Friends],DList,NDList));(Color==rojo, replace([Id,Color,Friends],[Id,azul,Friends],DList,NDList))). 


% I es un contador, para contar cuantos son diferentes en color
recorrerAmigos(DList,[X,_,[]],I,NI,Changed,NList):- nl, write(I), nl, write(NI), ((NI>I, cambiarCapa(DList,X,NList),Changed is 1, write('Se cambio la capa del duende '),write(X));(I>=NI,write('No se cambio la capa del duende '),write(X),Changed is 0,NList=DList)).
recorrerAmigos(DList, [X,C,[H|B]] , I, NI,Changed,NDList):- nth0(Index,DList,[H,_,_]) , nth0(Index,DList,[_,C2,_]),
                                 ((C==C2, I2 is I+1,recorrerAmigos(DList,[X,C,B],I2,NI,Changed,NDList)); (NI2 is NI+1,recorrerAmigos(DList,[X,C,B],I,NI2,Changed,NDList))).
% start:- I is 0, NI is 0,recorrerAmigos([1,rojo,[2,5,7,8]],I,NI,Changed,), write(I).

mismoColor([],Red,Blue,End):-Red==0->End is 1;
                             Blue==0->End is 1;
                             End is 0.
mismoColor([[_,C,_]|B],Red,Blue,End):- C==rojo-> NRed is Red+1;
                                       NBlue is Blue+1,
                                       mismoColor(B,NRed,NBlue,End).


day(DList,[],CapasCambiadas,ShouldEnd,NDList):-CapasCambiadas==0 -> ShouldEnd is 1;
                                        mismoColor(DList,0,0,End)-> ShouldEnd is End;
                                        ShouldEnd is 0,
                                        NDList= DList.
day(DList,[H|B],CapasCambiadas,ShouldEnd,NDList):- recorrerAmigos(DList,H,0,0,Changed,NList), Changed==1 -> NCapasCambiadas = CapasCambiadas+1 ;nl , day(NList,B,NCapasCambiadas,ShouldEnd,NDList).

run(_, 1).
run(DList,ShouldEnd):-day(DList, DList,0,SEnd,NDList), run(NDList,SEnd).

start:- duendes(X),Duendes =X, run(X,ShouldEnd) ,nl, write(Duendes), nl, write(NList).


% Busca un elemento y lo remplaza por uno nuevo, entra con la lista y sale con otra lista con el elemento remplazado
replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- H \= O, replace(O, R, T, T2).