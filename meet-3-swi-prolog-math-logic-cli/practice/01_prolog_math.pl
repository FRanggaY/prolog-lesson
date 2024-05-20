% Perkalian bilangan di atas 10 – 30

between_10_and_30(X) :-
    X > 10,
    X < 30.

multiply_between_10_and_30(X, Y, ResultMultiply) :-
    between_10_and_30(X),
    between_10_and_30(Y),
    ResultMultiply is X * Y.

% perpangkatan
is_power_between_3_and_4(Base, Power) :-
    between(3, 4, Base),
    is_power(Base, Power).

is_power(_, 1).
is_power(Base, Power) :-
    Power > 1,
    PowerMod is Power mod 1,
    PowerMod =:= 0,          
    ResultIsPower is Base * Base,  
    NewPower is Power - 1,   
    is_power(Base, NewPower).


% Faktorial 5-8
factorial(0, 1).
factorial(N, ResultFactorial) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, ResultFactorial1),
    ResultFactorial is N * ResultFactorial1.


factorial_between_5_and_8(N, ResultFactorial) :-
    between(5, 8, N),
    factorial(N, ResultFactorial).

% FPB 15-18
fpb(X, 0, X) :- X > 0.
fpb(X, Y, D) :- Y > 0, Z is X mod Y, fpb(Y, Z, D).

fpb_between_15_and_18(A, B, FPB) :-
    between(15, 18, A),
    between(15, 18, B),
    fpb(A, B, FPB).