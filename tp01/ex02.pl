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


% a - quem venceu corrida no Porto?
% ?- venceu(X, porto). -> X = jones

% b - qual equipa venceu no porto
% ?- equipaVenceu(E, porto). -> E = matador

% c - quais os pilotos que venceram mais de um circuito?
% ?- venceu(P, C1), venceu(P, C2), C1 \== C2. -> P = mangold

% d - que circuitos tem mais de 8 gates?
% ?- gates(C, G), G > 8. C = istanbul

% e - que pilotos não pilotam um Edge540?
% ?- aviao(A, P), A \= edge540. A = lamb