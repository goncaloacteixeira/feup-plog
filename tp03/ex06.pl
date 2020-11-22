delete_one(X, L, L1):-
  % guarda em La uma lista de L, e em Lb uma lista sem o elemento X
  append(La, [X|Lb], L), 
  % concatena as listas La e Lb na lista L1 para retornar
  append(La, Lb, L1).


delete_all(X, L, L1):-
  delete_one(X, L, L2),
  delete_all(X, L2, L1).
delete_all(X, L, L1):-
  \+ member(X, L),
  L1 = L.


delete_all_list([], L1, L1).
delete_all_list([X|T], L1, L2):-
  delete_all(X, L1, L3),
  delete_all_list(T, L3, L2).