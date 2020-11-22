ordenada([_]).
ordenada([N1, N2]):- N1 =< N2.
ordenada([N1, N2 | Resto]):-
  N1 =< N2,
  ordenada([N2|Resto])
.

ordena(List,Sorted):-
  i_sort(List,[],Sorted).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted):-
  insert(H,Acc,NAcc),
  i_sort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-
  X>Y,
  insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]) :- X=<Y.
insert(X,[],[X]).