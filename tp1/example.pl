male(phil).
female(claire).
male(luke).
parent(phil, luke). % parent(pai, filho)
father(F,C):-parent(F,C), male(F).
