/**********************************************************/
/*                                                        */
/*  Departamento de Ciencia de la Computación e           */
/*               Inteligencia Artificial                  */
/*  Universidad de Alicante                               */
/*                                                        */
/*                LOGICA DE PRIMER ORDEN                  */
/*                       Prolog                           */
/*                                                        */
/*  M. Jesús Castel                      Faraón Lloréns   */
/*                                                        */
/*       S.O.       :  MS-DOS (Windows)                   */
/*       Interprete :  SWI-Prolog                         */
/*       Fichero    :  EJ09.PL                            */
/*                                                        */
/**********************************************************/

/* ÁRBOL GENEALÓGICO                                      */

mensaje :- nl,write('Ejemplo "Árbol Genealógico" cargado.'),
           nl,nl.



/*----             PROGRAMA PRINCIPAL                 ----*/

/*------ Hechos ------*/

/* padres(H,P,M,A) <- H tiene como padre a P y como madre
                      a M, y nació el año A */
padres('Don Jose',p1,m1,1933).
padres('Doña Maria',p2,m2,1934).
padres('Jose','Don Jose','Doña Maria',1955).
padres('Maria','Don Jose','Doña Maria',1968).
padres('Antonia',p3,m3,1959).
padres('Maria Jose','Don Jose','Doña Maria',1961).
padres('Luis',p4,m4,1961).
padres('Jose Antonio','Jose','Antonia',1979).
padres('Pepe','Jose','Antonia',1983).
padres('Rosa',p5,m5,1985).
padres('Jose Luis','Luis','Maria Jose',1991).
padres('Maria Luisa','Luis','Maria Jose',1996).
padres('Pepito','Pepe','Rosa',2015).

/* casados(H,M) <- El hombre H está casado con la mujer M */
casados('Don Jose','Doña Maria').
casados('Jose','Antonia').
casados('Luis','Maria Jose').
casados('Pepe','Rosa').

/* hombre(P) <- la persona P es del género masculino */
hombre('Don Jose').
hombre('Jose').
hombre('Luis').
hombre('Jose Antonio').
hombre('Pepe').
hombre('Jose Luis').
hombre('Pepito').

/* mujer(P) <- la persona P es del género femenino */
mujer('Doña Maria').
mujer('Antonia').
mujer('Maria').
mujer('Maria Jose').
mujer('Rosa').
mujer('Maria Luisa').


/*------ Reglas ------*/

/* edad(P,E) <- la persona P tiene E años */
edad(P,E) :-  padres(P,_,_,A), E is 2017-A.

/* mayor(P1,P2) <- la persona P1 es mayor que P2 */
mayor(P1,P2) :- padres(P1,_,_,A1), padres(P2,_,_,A2), A1<A2.
mayor(P1,P2) :- edad(P1,E1), edad(P2,E2), E1>E2.

/* niño(P1) <- P1 es un niño (menos de 14 años) */
niño(P1) :- edad(P1,E), E<14.

/* joven(P1) <- P1 es una persona joven (entre 14 y 25 años) */

/* adulto(P1) <- P1 es un adulto (entre 25 y 50 años) */

/* viejo(P1) <- P1 es una persona vieja (más de 50 años) */

/* hermanos(H1,H2) <- H1 es hermano/a de H2 */
hermanos(P1,P2) :- padres(P1,Pa,Ma,_), padres(P2,Pa2,Ma2,_),(Pa==Pa2;Ma==Ma2),P1\= P2.
hermano(P1,P2) :- padres(P1,P,M,_), padres(P2,P,M,_), P1\=P2.

/* tio(T,S) <- T es el tio de S, considere tios politicos */
tio(T,S) :- hombre(T), (hermano(T,X); hermano(T,M)), padres(S,X,M,_).
tio(T,S) :- hombre(T), padres(S,P,M,_), (hermano(P,X);hermano(M,X)), casados(T,X).

/* tia(T,S) <- T es la tia de S, considere tios politicos */

/* primos(P1,P2) <- P1 es primo/a de P2 */

/* abuelo(A,N) <- A es el abuelo de N */

/* abuela(A,N) <- A es la abuela de N */

/* antepasado(A,P) <- A es antepasado de P */


:- mensaje.





