iterasi(N) :-
    iterasi(1, N, [], [], Even, Odd),
    print_list("Bilangan ganjil adalah ", Odd),
    print_list("Bilangan genap adalah ", Even).

iterasi(Start, End, EvenAcc, OddAcc, Even, Odd) :-
    Start =< End,
    (
        (Start mod 2 =:= 0 ->
            append(EvenAcc, [Start], NewEvenAcc),
            NewOddAcc = OddAcc
        ;
            NewEvenAcc = EvenAcc,
            append(OddAcc, [Start], NewOddAcc)
        )
    ),
    Next is Start + 1,
    iterasi(Next, End, NewEvenAcc, NewOddAcc, Even, Odd).

iterasi(_, _, Even, Odd, Even, Odd). % stop recursion

print_list(_, []).
print_list(Label, [H|T]) :-
    write(Label), write(H), nl,
    print_list(Label, T).
