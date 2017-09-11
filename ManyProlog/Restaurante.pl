entrada(paella).
entrada(gazpacho).
entrada(consome).
carne(filete_de_cerdo).
carne(pollo_asado).
pescado(trucha).
pescado(bacalao).
postre(flan).
postre(nueces_con_miel).
postre(naranja).
calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_de_cerdo, 300).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja, 50).

%Un plato principal si es un plato de carne o pescado.
plato_Principal(X) :- carne(X); pescado(X).

%La comida consta de 3 platos, una entrada "X" ,un plato "Y" y un
% postre "Z".
comida(X,Y,Z) :- entrada(X), plato_Principal(Y), postre(Z).

% Definir la relacion "valor_calorico(X,Y,Z,V)" que indicara que la
% comida(X,Y,Z) suma en total "V" calorias.
valor_Calorico(X,Y,Z,V) :- calorias(X,V1), calorias(Y,V2), calorias(Z,V3), V is V1+V2+V3.

%Definir la relacion "valor_calorico(X,Y,Z,V)" que indicara que la
% comida(X,Y,Z) suma en total "V" calorias sea menor a 800.
comida_equilibrada(X,Y,Z) :- valor_Calorico(X,Y,Z,V), V<800.
