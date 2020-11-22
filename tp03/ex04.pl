inverter(L1, L2):-
  rev(L1, [], L2).

rev([], R, R).
rev([H|T], S, R):-
  rev(T, [H|S], R).