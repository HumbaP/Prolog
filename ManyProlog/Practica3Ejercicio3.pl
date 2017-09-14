/*
EJERCICIO 3:
==============================
ALUMNO DESPISTADO:

�Un alumno de ISC del ITC, debido al nerviosismo del primer d�a de clase,
ha anotado el nombre de sus profesores (Elisa, Fernando y Carlos), las
asignaturas que se imparten (L�gica, Programaci�n y Matem�ticas) y el d�a
de la semana de las distintas clases (lunes, mi�rcoles y viernes), pero
s�lo recuerda que:


Ay�dale a relacionar cada profesor con su asignatura, as� como el d�a de la
semana que se imparte

(Sabemos que cada profesor imparte una �nica asignatura y que las clases se dan
en d�as diferentes)�*/

profesor(elisa).
profesor(fernando).
profesor(carlos).
materia(logica).
materia(programacion).
materia(matematicas).
dia(lunes).
dia(miercoles).
dia(viernes).

% - La clase de Programaci�n, impartida por Elisa, es posterior a la de
%L�gica
imparte(elisa, programacion).
imparte(Maestro, Materia) :- materia(Materia), profesor(Maestro),
	Maestro\=elisa, Materia\=programacion.
horario(logica, Dia) :- dia(Dia), Dia\=lunes, Dia\=miercoles.
horario(Materia,Dia) :- materia(Materia), dia(Dia), Materia\=logica.

% - A Carlos no le gusta trabajar los lunes, d�a en el que no se imparte
% L�gica
trabaja(carlos, Dia) :- dia(Dia), Dia\=lunes.
trabaja(Maestro, Dia) :- profesor(Maestro), dia(Dia), Maestro\=carlos.

%clase(X, Y, Z) :- imparte(X,Y), horario(Y,Z), trabaja(X,Z).

diferentes(A,B,C) :- A\=B,A\=C,B\=C.

respuesta([[P1,M1,D1],[P2,M2,D2],[P3,M3,D3]]):-
	imparte(P1,M1),imparte(P2,M2),imparte(P3,M3),
	horario(M1,D1),horario(M2,D2),horario(M3,D3),
	trabaja(P1,D1),trabaja(P2,D2),trabaja(P3,D3),

	diferentes(P1,P2,P3),
	diferentes(M1,M2,M3),
	diferentes(D1,D2,D3).

