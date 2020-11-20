factorial(0, 1).
factorial(N, Valor):-
  N > 0,
  N1 is N - 1, factorial(N1, V1),
  Valor is N * V1.


fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, Valor):-
  N > 1,
  N1 is N - 1, fibonacci(N1, V1),
  N2 is N - 2, fibonacci(N2, V2),
  Valor is V1 + V2 
.