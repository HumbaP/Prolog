%Lista que busque un elemento.
%pertenece(X,[X|Y]).
%pertenece(X,[Y|Z]):- pertenece(X,Z).

pertenece(C,[C|_]).
pertenece(C,[_|R]):- pertenece(C,R).

%?-pertenece(i,[a,e,i,o,u]).
%?-true.
%
%?-pertenece(j,[a,e,i,o,u]).
%?-false.
%
%?-pertenece(juan,[pedro,maria,paco,nadia,juan]).
%?-true.
%
%?-pertenece(manuelon,[pedro,maria,paco,nadia,juan]).
%?-false.
















