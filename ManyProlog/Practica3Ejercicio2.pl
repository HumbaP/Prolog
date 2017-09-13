/*EJERCICIO 2:
======================================
Encuentra la ocupación de cada mujer:

(a) Clara es violentamente alérgica a las plantas.
(b) Luisa y la florista comparten el departamento
(c) A María y Luisa les gusta solamente la música rock
(d) La jardinera, la diseñadora de modas y Nélida no se conocen entre sí.
e) una mujer no puede tener una ocupación que esté relacionada con algo a lo que es alérgica:
f) cada mujer tiene un solo trabajo, y  cada trabajo es ocupado por una sola mujer las cuatro mujeres elegidas y las cuatro ocupaciones  deben ser diferentes entre sí.

	?- respuesta(X).
	X=[[clara,diseñadora],[luisa,jardinera],
	   [maria,florista],[nelida,directora_de_orquesta]]
	Yes
*/
mujer(clara).
mujer(luisa).
mujer(maria).
mujer(nelida).
ocupacion(florista).
ocupacion(jardinera).
ocupacion(diseñadora).
ocupacion(directora).
%a).
alergica(clara,plantas).
relacionada(florista, plantas).
relacionada(jardinera, plantas).
%noEs(clara, florista).
%noEs(clara, jardinera).
%C)regloa.
hace(maria, soloEscuchaRock).
hace(luisa, soloEscuchaRock).
incompatible(director, soloEscuchaRock).

%b).
noEs(luisa, florista).

%c)Hecho.
%noEs(maria, directora).
%noEs(luisa, directora).
noEs(Mujer, Ocupacion) :- incompatible(Ocupacion, X), hace(Mujer, X).

%d).
noEs(nelida, jardinera).
noEs(nelida, diseñadora).

%e).
noEs(Mujer, Ocupacion) :- alergica(Mujer, X), relacionada(Ocupacion, X).

%f).
diferentes(A,B,C,D) :- A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.
respuesta([[M1,O1], [M2,O2], [M3,O3], [M4,O4]]):-
	mujer(M1),mujer(M2),mujer(M3),mujer(M4),
	ocupacion(O1), ocupacion(O2), ocupacion(O3) ,ocupacion(O4),
	diferentes(M1, M2, M3, M4), diferentes(O1, O2, O3, O4),
	not(noEs(M1, O1)), not(noEs(M2, O2)), not(noEs(M3, O3)), not(noEs(M4, O4)).

