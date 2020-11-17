% piloto(X) - X é um piloto
piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

% equipa(E, P) - piloto P é da equipa E
equipa(breitling, lamb).
equipa('red bull', besenyei).
equipa('red bull', chambliss).
equipa('mediterranean racing team', maclean).
equipa(cobra, mangold).
equipa(matador, jones).
equipa(matador, bonhomme).

% aviao(A, P) - P pilota aviao A
aviao(mx2, lamb).
aviao(edge540, besenyei).
aviao(edge540, chambliss).
aviao(edge540, maclean).
aviao(edge540, mangold).
aviao(edge540, jones).
aviao(edge540, bonhomme).

% circuito(X) - X é um circuito
circuito(istanbul).
circuito(porto).
circuito(budapest).

% venceu(P, C) - piloto X venceu no circuito C
venceu(jones, porto).
venceu(mangold, budapest).
venceu(mangold, istanbul).

% gates(C, G) - circuito C tem G gates
gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

% a quipa vence quando um piloto da equipa vence
equipaVenceu(E, C) :- venceu(P, C), equipa(E, P).
