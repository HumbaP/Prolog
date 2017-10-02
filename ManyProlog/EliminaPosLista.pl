%Si queremos eliminar un elemento de la lista.
%Si X es la cabeza de la lista, la cola T es la lista sin X.
%Si X no es la cabeza de la lista, conservamos la cabeza de la lista
%como parte de la respuesta y continuamos eliminando X de la cola T

elimina(X,[X|T],T).
elimina(X,[Y|L],[Y|R]):- elimina(X,L, R).

% La insercion un elemento en la cabeza de una lista
% inserta(E,inicial,Lista).

inserta(X,[],[X|[]]).
inserta(X,Z,[X|Z]).

%Como obtener e n-�simo elemento de una lista.

enesimo(_,[],[]).
enesimo(1,[X|_],X).
enesimo(N,[_|L],X):-N>1, N1 is N-1, enesimo(N1,L,X).

%longitud de una lista.

tama�o([],0).
tama�o([_|L],T):- length(L,T1), T is T1+1.

%Buscar un elemento en una lista, regresar:
%true. si lo encontramos.
%false. si no lo encontramos.

busca(X,[]).
