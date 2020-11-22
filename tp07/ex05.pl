/* 
    X-Y para estado do jogo
    X capacidade do balde de 4L
    Y capacidade do balde de 3L
*/

initial(0-0).
final(2-_Y).

move(X-Y, Z-3) :- Z is X - (3 - Y), Z >= 0.
move(X-Y, Z-0) :- Z is X + Y, Z =< 4.
move(X-Y, 4-Z) :- Z is Y - (4 - X), Z >=0.
move(X-Y, 0-Z) :- Z is X + Y, Z =< 3.

move(0-Y, 4-Y).
move(X-0, X-3).
move(X-Y, X-0) :- Y > 0.
move(X-Y, 0-Y) :- X > 0.

moves(Xs) :- moves([0-0],Xs).
moves([X0-Y0|T], [X1-4,X0-Y0|T])
    :- move(X0-Y0,X1-4), !.
moves([X0-Y0|T],Xs) :-
    move(X0-Y0, X1-Y1), 
    not(member(X1-Y1,[X0-Y0|T])),
    moves([X1-Y1,X0-Y0|T],Xs).

not(X):-
    \+ X.


next(_X-Y, 0-Y, e1). % esvaziar primeiro balde
next(_X-Y, X-0, e2). % esvaziar segundo balde
next(_X-Y, 4-Y, e3). % encher primeiro balde
next(_X-Y, X-3, e4). % encher segundo balde
% TODO - Passar de um balde para o outro

