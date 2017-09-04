divide(2,6).
divide(2,4).
divide(2,12).
divide(3,6).
divide(3,12).
divide(6,X) :- divide(2,X), divide(3,X).


