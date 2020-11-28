:- use_module(library(lists)).
:- dynamic film/4, movimento/1.

film('Doctor Strange', [action, adventure, fantasy], 115, 7.6).
film('Hacksaw Ridge', [biography, drama, romance], 131, 8.7).
film('Inferno', [action, adventure, crime], 121, 6.4).
film('Arrival', [drama, mystery, scifi], 116, 8.5).
film('The Accountant', [action, crime, drama], 127, 7.6).
film('The Girl on the Train', [drama, mystery, thriller], 112, 6.7).

user(john, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'Portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

vote(john, ['Inferno'-7, 'Doctor Strange'-9, 'The Accountant'-6]).
vote(jack, ['Inferno'-8, 'Doctor Strange'-8, 'The Accountant'-7]).
vote(peter, ['The Accountant'-4, 'Hacksaw Ridge'-7, 'The Girl on the Train'-3]).
vote(harry, ['Inferno'-7, 'The Accountant'-6]).
vote(richard, ['Inferno'-10, 'Hacksaw Ridge'-10, 'Arrival'-9]).

% exercicio 1 -> predicado para determinar se um filme é curto (duração <125)
curto(Filme):-
    film(Filme, _, Duracao, _),
    Duracao < 125.

% exercicio 2 -> predicado que devolve a diferença de votos de um filme entre duas pessoas
diff(User1, User2, Difference, Movie):-
    vote(User1, List1),
    member(Movie-Vote1, List1),
    vote(User2, List2),
    member(Movie-Vote2, List2),
    absDiff(Vote1, Vote2, Difference).

absDiff(N1, N2, Result):-
    N2 < N1,
    Result is (N1 - N2).
absDiff(N1, N2, Result):-
    Result is (N2 - N1).

% exercicio 3 -> predicado para verficiar se User deu classificação igual ou superior a 8 a pelo menos
% dois filmes diferentes
niceGuy(User):-
    vote(User, Votes),
    member(Movie1-Vote1, Votes),
    Vote1 >= 8,
    member(Movie2-Vote2, Votes),
    Movie2 \= Movie1,
    Vote2 >= 8.

% exercicio 4 -> predicado para determinar elementos comuns em duas listas
elemsComuns([], [], _).
elemsComuns([H1|T1], [H1|Common], List2):-
    member(H1, List2), !,
    elemsComuns(T1, Common, List2).
elemsComuns([_|T1], Common, List2):-
    elemsComuns(T1, Common, List2).

% exercicio 5 -> predicado para mostrar todos os filmes de uma categoria
printCategory(Category):-
    film(Title, Cats, Duration, Avg),
    member(Category, Cats),
    format('~s (~dmin, ~1f/10)\n', [Title, Duration, Avg]),
    fail.
printCategory(_).

% exercicio 6
similarity(Filme1, Filme2, Similarity):-
    film(Filme1, Cats1, Dur1, Avg1),
    film(Filme2, Cats2, Dur2, Avg2),
    append(Cats1, Cats2, AuxCatsWithDups),
    remove_dups(AuxCatsWithDups, Cats),
    length(Cats, NumberCats),
    elemsComuns(Cats1, CommonCats, Cats2),
    length(CommonCats, NumberCommonCats),
    CatsPercentage is (NumberCommonCats/NumberCats)*100,
    DurDiff is abs(Dur1 - Dur2),
    AvgDiff is abs(Avg1 - Avg2),
    Similarity is (CatsPercentage - 3 * DurDiff - 5 * AvgDiff).

% exercicio 7
mostSimilar(Film, Similarity, Films):-
    bagof(Sim, (similarity(Film, F, Sim), Film \= F), [Similarity]),
    Similarity > 10, !,
    findall(F2, similarity(Film, F2, Similarity), Films).
mostSimilar(_, 0, []).

% exercicio 8
getFilmesApenas([],[]).
getFilmesApenas([Filme-_|T1], [Filme|T2]):-
    getFilmesApenas(T1,T2).

sumDiff([], 0).
sumDiff([X-Y|Resto], Diff):-
    sumDiff(Resto, Diff1),
    Diff is Diff1 + abs(X-Y).

avgDiff(Differences, AvgDiff):-
    sumDiff(Differences, SumDiff),
    length(Differences, Size),
    AvgDiff is SumDiff / Size.

ageDiff(User1, User2, AgeDiff):-
	user(User1, Year1, _),
	user(User2, Year2, _),
	AgeDiff is abs(Year1 - Year2).

countryDiff(User1, User2, 0):-
	user(User1, _, Country1),
	user(User2, _, Country1).
countryDiff(_User1, _User2, 2).

distancia(User1, Distance, User2):-
    vote(User1, Votes1),
    vote(User2, Votes2),
    getFilmesApenas(Votes1, FilmesComuns1),
    getFilmesApenas(Votes2, FilmesComuns2),
    elemsComuns(FilmesComuns1, FilmesComuns, FilmesComuns2),
    findall(Vote1-Vote2,
        (
            member(Filme, FilmesComuns),
            member(Filme-Vote1, Votes1),
            member(Filme-Vote2, Votes2)
        ), Differences),
    avgDiff(Differences, AvgDiff),
    ageDiff(User1, User2, AgeDiff),
    countryDiff(User1, User2, CountryDiff),
    Distance is AvgDiff + AgeDiff/3 + CountryDiff.

% exercicio 9
update(Film):-
	findall(Score, (vote(_User, Votes), member(Film-Score, Votes)), Scores),
	sumlist(Scores, Sum),
	length(Scores, Count),
	NewScore is Sum / Count,
	retract(film(Film, Categories, Duration, _)),
	assert(film(Film, Categories, Duration, NewScore)).

% exercicio 11
validC(Position):- Position =< 8, Position >= 1.
valid(X/Y):- validC(X), validC(Y).
moveTo(L/C, Lf/Cf):-
    PossibleMoves = [[1,2],[2,1],[-1,2],[2,-1],[1,-2],[-2,1],[-1,-2],[-2,-1]],
    member([Dx,Dy], PossibleMoves),
    Lf is Dx + L,
    Cf is Dy + C,
    valid(Lf/Cf).
move(L/C, Celulas):-
    setof(X/Y, moveTo(L/C, X/Y), Celulas).

