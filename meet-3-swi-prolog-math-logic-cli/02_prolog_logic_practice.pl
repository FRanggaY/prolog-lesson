% NAND

nand(true, true, false).
nand(true, false, true).
nand(false, true, true).
nand(false, false, true).

% NOR
nor(true, true, false).
nor(true, false, false).
nor(false, true, false).
nor(false, false, true).

% IMPLICATION
implies(true, false) :- !.
implies(_, true).


% table condition
table(X, Y, Z) :-
  (X = true, Y = true, Z = true) ;
  (X = true, Y = false, Z = false) ;
  (X = false, Y = true, Z = false) ;
  (X = false, Y = false, Z = false).