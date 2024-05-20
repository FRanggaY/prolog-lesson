iterasi(N) :-
    iterasi(1, N).

iterasi(Start, End) :-
    Start =< End,
    (
        (Start mod 2 =:= 0, write(Start), write(' adalah bilangan genap'), nl);
        (Start mod 2 =\= 0, write(Start), write(' adalah bilangan ganjil'), nl)
    ),
    Next is Start + 1,
    iterasi(Next, End).

iterasi(_, _). % stop recursion