conta([], 0).
conta([_|T], N):-
    N > 0,
    N1 is N - 1,
    conta(T,N1).

conta_elem(_, [], 0).
conta_elem(X, [Y|L1], N):-
    N > 0,
    Y \= X,
    conta_elem(X, L1, N).
conta_elem(X, [X|L1], N):-
    N > 0,
    N1 is N-1,
    conta_elem(X, L1, N1).