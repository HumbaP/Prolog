%Otro
%Supongamos que queremos razonar sobre la genealogia de una famlia
%Base de conocimiento

padre(pam,bob).
padre(tom,bob).
padre(tom,liz).
padre(bob,ann).
padre(bob,pat).
padre(pat,jim).

hijo(X,Y):- padre(Y,X).
hermano(X,Y):-padre(Z,X), padre(Z,Y), dif(X,Y).
abuelo(X,Y):-padre(X,Z), padre(Z,Y).
abuelo(X,Y):-hijo(Y,Z),padre(X,Z).

%Bisabuelo
%Tio
%TioAbuelo
%Sobrino
%PrimoHermanoo
%Nieto
%BisNieto
