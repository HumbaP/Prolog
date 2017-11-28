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

duendes([[1,rojo,  [2]],
        [2,rojo,  [1,3]],
        [3,azul,  [2]],
        [4,azul,  []]
]).

%Funciona alv!
cambiarCapa(DList, Id, NDList):- nl,write(Id),nl ,
                                 nth0(Index,DList,[Id,_,_]),
                                 write(Index),nl,
                                 nth0(Index,DList,[Id,Color,Friends]),
                                 Color==azul -> 
                                     replace([Id,Color,Friends],[Id,rojo,Friends],DList,NList),
                                     write(NList),
                                     copy(NList,NDList);
                                 replace([Id,Color,Friends],[Id,azul,Friends],DList,NList),
                                 write(NList),
                                 copy(NList,NDList) .
                                        

% I es un contador, para contar cuantos son diferentes en color
recorrerAmigos(DList,[X,_,[]],I,NI,Changed,NList):-
                                                    nl, write(I),
                                                    nl, write(NI), nl,
                                                    write('----------------------Mas'),nl,
                                                    ((NI>I,
                                                        cambiarCapa(DList,X,NList),
                                                        nl,write('Capa cambiada de '),nl,write(DList),nl,
                                                        write('a '),nl,write(NList),nl,
                                                        Changed is 1,
                                                        write('Se cambio la capa del duende '),write(X));
                                                     (I>=NI,write('No se cambio la capa del duende '),
                                                        write(X),
                                                        Changed is 0,
                                                        NList=DList)).

recorrerAmigos(DList, [X,C,[H|B]] , I, NI,Changed,NDList):-
                                                            nth0(Index,DList,[H,_,_]) ,
                                                            nth0(Index,DList,[_,C2,_]),
                                                            C==C2 ->
                                                                I2 is I+1,
                                                                recorrerAmigos(DList,[X,C,B],I2,NI,Changed,NDList);
                                                            NI2 is NI+1,
                                                            recorrerAmigos(DList,[X,C,B],I,NI2,Changed,NDList).

recorreDia(DL,[],CapasCambiadas,ShouldEnd,NList):-write(DL), nl, write(CapasCambiadas),nl,
                                            mismoColor(DL,0,0,End),
                                            copy(DL,AuxNList),
                                            nl,nl,write('--------PRE-DIA SIGUIENTE-------'),nl,
                                            write(AuxNList),nl,
                                            write('Pre-condicion'),nl,
                                            (CapasCambiadas == 0 -> write('Nadie cambio su capa, FIN DEL PROGRAMA'),ShouldEnd is 1;
                                            End==1 -> write('Todos son del mismo color, FIN DEL PROGRAMA'),ShouldEnd is 1;
                                            ShouldEnd is 0),
                                            NList=AuxNList.
recorreDia(DList,[Duende|Mas],CapasCambiadas,ShouldEnd,NList):-recorrerAmigos(DList, Duende, 0,0,Changed,NDList),
                                            write("Recorrido duende"),nl,
                                            write(Duende),nl,
                                            write('Lista nueva op------'),nl,write(NDList),
                                            nl,write(Changed),
                                            (Changed == 1 -> 
                                                        nl,write('Capa cambiada'), nl,
                                                        NC is CapasCambiadas+1 ,
                                                        recorreDia(NDList,Mas,NC,ShouldEnd,NList)
                                                        ;
                                            recorreDia(NDList,Mas,CapasCambiadas,ShouldEnd,NList)).
% start:- I is 0, NI is 0,recorrerAmigos([1,rojo,[2,5,7,8]],I,NI,Changed,), write(I).

recorrer(_,ShouldEnd,Contador,_):- ShouldEnd ==1 -> 
                                    nl,write('Se acabo el Recorrido por condicion');
                                    Contador == 10 -> 
                                    nl, write('Se acabo el recorrido por exceso de dias').
recorrer(Duendes,ShouldEnd,Contador,AcList):-
                                            nl,write('----------------------------------NUEVO DIA----------------------------------'),
                                            recorreDia(Duendes,Duendes,0,ShouldEnd,AuxcList), NC is Contador+1, 
                                            recorrer(AuxcList, ShouldEnd,NC, NL).
recorrer:-duendes(X), copy(X,Duendes), recorrer(Duendes,ShouldEnd,0,AcList).%recorreDia(Duendes,Duendes,0,ShouldEnd,AcList),nl,write('Acabado').
mismoColor([],Red,Blue,End):-write('Mismo Color ejecutado'),
                             Red==0->End is 1;
                             Blue==0->End is 1;
                             End is 0.
mismoColor([[_,C,_]|B],Red,Blue,End):- C==rojo-> NRed is Red+1,mismoColor(B,NRed,Blue,End);
                                       NBlue is Blue+1,
                                       mismoColor(B,Red,NBlue,End).
runMismo:-duendes(X), Duendes = X, mismoColor(X,0,0,End),write(End).


do(X):- copy(X,Y), write(Y).
copy(L,R):-acCP(L,R).
acCP([],[]).
acCP([H|T1],[H|T2]):-acCP(T1,T2).

% Busca un elemento y lo remplaza por uno nuevo, entra con la lista y sale con otra lista con el elemento remplazado
replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- H \= O, replace(O, R, T, T2).
