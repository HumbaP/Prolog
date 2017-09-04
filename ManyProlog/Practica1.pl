%hecho
%A partir de la siguiente base de conocimiento en prolog,
%crear las reglas necesarias para que el intérprete nos
%diga qué alimento puede comer cada animal:
herbivoro(vaca).

herbivoro(oveja).

carnivoro(leon).

hortaliza(tomate).

hortaliza(zanahoria).

fruta(manzana).

pescado(besugo).

carne(salchicha).

fideos(spaghetti).



%Creamos las reglas:
come(X,Y) :-(herbivoro(X), (hortaliza(Y); fruta(Y)));
            (carnivoro(X), (carne(Y);pescado(Y);herbivoro(Y))).
