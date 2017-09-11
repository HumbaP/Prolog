






mayor(X,Y,X) :- X>=Y.
mayor(X,Y,Y) :- Y>X.
max(X,Y) :-  mayor(X,Y,Max); mayor(X,Y,Max).


