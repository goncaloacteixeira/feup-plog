% enunciado : https://drive.google.com/drive/folders/1clnkHksTIOGn_z-KlfV-mDaVZ4tTMqxC?usp=sharing

%player(Name, UserName, Age)
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).

%game(Name, Categories, MinAge)
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16).
game('Duas Botas', [action, free, strategy, moba], 12).

%played(Player, Game, HoursPlayed, PercentageUnlocked)
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player', 'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).



% exercicio 1 -> predicado para determinar se o +Player atingiu pelo menos 80% em algum jogo
achievedALot(Player):-
  played(Player, _, _, Percentage),
  Percentage >= 80.

% exercicio 2 -> predicado para determinar se o jogo é adequando à idade do jogador
isAgeAppropriate(Name, Game):-
  player(Name, _, Age),
  game(Game, _, MinAge),
  Age >= MinAge.

% exercicio 3
% timePlayingGames(+Player, +Games, -ListOfTime, -SumTimes)
% determina o no total de horas que o Player investiu a jogar cada um dos jogos na lista Games,
% ListOfTimes é a lista com os tempos de cada um dos Games por Ordem, e SumTimes é a soma desses tempos
timePlayingGames(_, [], [], 0).
timePlayingGames(Player, [Game|Games], [X|Resto], Sum):-
  timePlayingGames(Player, Games, Resto, Sum1),
  played(Player, Game, X, _),
  Sum is (Sum1 + X).
timePlayingGames(_, [_], [0], 0).

% exercicio 4 -> predicado para listar os jogos que se enquadram na categoria
listGamesOfCategory(Cat):-
  game(Name, Categories, MinAge),
  member(Cat, Categories),
  format('~s (~d)\n', [Name, MinAge]),
  fail.
listGamesOfCategory(_).

% exercicio 5 -> predicado para atualizar a base de conhecimentos do prolog
updatePlayer(Player, Game, Hours, Percentage):-
  retract(played(Player, Game, OldHours, OldPercentage)), !,
  NewHours is OldHours + Hours,
  NewPercentage is OldPercentage + Percentage,
  assert(played(Player, Game, NewHours, NewPercentage)).
updatePlayer(Player, Game, Hours, Percentage):-
  assert(played(Player, Game, Hours, Percentage)).

% exercicio 6 -> predicado que devolve a lista de jogos nos quais os jogador investiu menos de 10h
fewHours(Player, Games):-
  fewHours(Player, [], Games).
fewHours(Player, Acc, Games):-
  played(Player, Game, Hours, _),
  Hours < 10,
  \+ member(Game, Acc),
  fewHours(Player, [Game | Acc], Games).
fewHours(_, Games, Games).

% exercicio 7 -> predicado para devolver players com idades num determinado range
ageRange(MinAge, MaxAge, Players):-
   findall(PlayerName,
    (player(PlayerName, _, PlayerAge), PlayerAge =< MaxAge, PlayerAge >= MinAge),
    Players).

% exercicio 8 -> predicado para calcular a media das idades dos jogadores do jogo Game
sumList([H], H).
sumList([H|T], Sum):-
  sumList(T, Sum1),
  Sum is (Sum1 + H).

averageAge(Game, AverageAge):-
  findall(Age, (played(Name, Game, _, _), player(_, Name, Age)), Ages),
  sumList(Ages, Sum),
  length(Ages, Size),
  AverageAge is Sum/Size.