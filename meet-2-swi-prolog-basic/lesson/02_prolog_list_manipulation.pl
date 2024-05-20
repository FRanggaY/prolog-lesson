% manipulate list

findLast(X, [X]).
findLast(X, [_|T|]) :- findLast(X, T).

find(X,X) :- find(X,X).
findFirst(X, [H|_]) :- find(X,H).

findSecondLast(X, [X,_]).
findSecondLast(X, [_|T]) :- findSecondLast(X,T).

findAt(1,X, [X|_]).
findAt(E,X, [_|T]) :- K is E-1, findAt(K,X,T).

findLength(X, [H|T]) :- countLength(X, [H|T], 0).
countLength(X,[],X).
countLength(X,[+|T],C) :- D is C+1, countLength(X,T,D).

