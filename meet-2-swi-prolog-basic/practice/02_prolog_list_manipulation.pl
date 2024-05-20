reverse([], []).
reverse([Head | Tail], ReversedList) :-
  reverse(Tail, SubList),
  append(SubList, [Head], ReversedList).


palindrome(List) :-
  reverse(List, ReversedList),
  List = ReversedList.

remove_duplicates([], []).
remove_duplicates([Head | Tail], UniqueList) :-
  member(Head, Tail),
  remove_duplicates(Tail, UniqueList);
  append([Head], SubList, UniqueList),
  remove_duplicates(Tail, SubList).

duplicate([], []).
duplicate([Head | Tail], DuplicatedList) :-
  duplicate(Head, HeadDuplicated),
  append(HeadDuplicated, TailDuplicated, DuplicatedList),
  duplicate(Tail, TailDuplicated).

duplicate(Element, [Element, Element]).


delete_at(Index, List, NewList) :-
  length(List, Length),
  Index > 0,
  Index =< Length,
  split(List, Index, Before, After),
  append(Before, After, NewList).

split([Head | Tail], 1, [], [Head | Tail]).
split([Head | Tail], Index, [Head | Before], After) :-
  NewIndex is Index - 1,
  split(Tail, NewIndex, Before, After).
split([], _, [], []).
