% Elabore un programa en prolog que defina lo siguiente:
% 1) Las algas usan medias rojas.
%2) Todo objeto o animal o persona que usa  desodorante sabe tocar el saxo.
%3) Todo lo que eche humo usa desodorante.
% 4) Nada ni nadie que usa medias rojas puede tocar el saxo.
% 5) Todas las personas  puede usar un objeto
% 6) Si una persona usa desodorante no hara la tarea
% 7) Si usa desodorante y puede usar un objeto echa humo
% 8)Cualquier animal que corre es feliz
% 9) Los hippies son felices y pueden tocar el saxo
% 10) libre

objeto(lentes).
objeto(plumon).
persona(maria).
persona(aurora).
animal(leia).
animal(leonardo).
usaDesodorante(leia).
usaDesodorante(aurora).
usaGorra(aurora).
tiene(paella, mariscos).
tiene(sushi, alga).
tiene(mole, chocolate).
%1)
usaMediasRojas(algas).

%2)
tocaSaxo(X) :-  (objeto(X);animal(X);persona(X)), usaDesodorante(X).
%4)
tocaSaxo(X) :- not(usaMediasRojas(X)).

%3)
echaHumo(X) :- usaDesodorante(X).

%11)Bailan los que no pueden tocar el saxo.
bailan(X) :- not(tocaSaxo(X)).

%12)Los que usan gorran no pueden bailar y usan desodorante.
usaGorra(X) :- not(bailan(X)) , usaDesodorante(X).
%14) Si usa gorran, no usa medias rojas.
usaGorra(X) :- not(usaMediasRojas(X)).
%17)Los que dibujan usan gorra.
usaGorra(X) :- not(noDibujan(X)).

%13)Los que bailan tambien cantan.
cantan(X) :- bailan(X).

%15)Todos los que bailan, cantan y usan medias rojas son mujeres.
sonMujer(X) :- cantan(X), usaMediasRojas(X). %no se pone bailan por que al declarar que cantan a la vez bailan(regla 13).

%16)Los que cantan y bailan no dibujan.
noDibujan(X) :- cantan(X).

%18)Para poder volar necesitas usar medias rojas y usar desodorante.
volar(X) :- usaMediasRojas(X), usaDesodorante(X).

%19)Los hombres usan desodorante y gorra.
hombre(X) :- usaDesodorante(X), usaGorra(X).

%20}Los transexuales usan desodorante, gorra y cantan.
trans(X) :- hombre(X), cantan(X).

%21)Todo lo que tiene alga es sushi.
sushi(X) :- tiene(X,alga).

%22)Las mujeres que tocan el sax, son sexis.
sexis(X) :- sonMujer(X), tocaSaxo(X).










