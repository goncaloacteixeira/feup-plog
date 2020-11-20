e_primo(N):-
  integer(N),
  N > 3,
  (N mod 2) =\= 0, 
  % não tem fatores sem ser ser ele próprio
  \+ tem_factor(N, 3).

tem_factor(N, L) :- N mod L =:= 0.
tem_factor(N, L) :-
  L * L < N,
  L2 is L + 2,
  tem_factor(N, L2).