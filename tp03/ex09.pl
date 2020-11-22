substitui(_, _, [], []).
substitui(O, R, [O|T], [R|T2]) :- 
  substitui(O, R, T, T2).
substitui(O, R, [H|T], [H|T2]) :- 
  H \= O, 
  substitui(O, R, T, T2).

elimina_duplicados([],[]).
elimina_duplicados([H|T], List) :-    
  member(H, T),
  elimina_duplicados(T, List).
elimina_duplicados([H|T], [H|T1]) :- 
  \+member(H, T),
  elimina_duplicados(T, T1).