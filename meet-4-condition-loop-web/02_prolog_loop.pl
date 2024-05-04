iterasi(1) :-
    write(1), nl.

iterasi(N) :-
    N > 1,
    write(N), nl,
    N1 is N - 1,
    iterasi(N1).