% o joão é aluno de paradigmas
aluno(joao, paradigmas). 
aluno(maria, paradigmas). 
aluno(joel, lab2). 
aluno(joel, estruturas).  

% o joao frequenta a feup
frequenta(joao, feup). 
frequenta(maria, feup).  
frequenta(joel, ist).

% o carlos é professor de paradigmas
professor(carlos, paradigmas). 
professor(ana_paula, estruturas).  
professor(pedro, lab2). 

% o pedro é funcionario do ist
funcionario(pedro, ist). 
funcionario(ana_paula, feup).  
funcionario(carlos, feup).


% a - quem são os alunos do professor X?

professor_do_aluno(Professor, Aluno) :- 
  funcionario(Professor, _I), 
  professor(Professor, _D), 
  frequenta(Aluno, _I), 
  aluno(Aluno, _D).
% ?- professor_do_aluno(carlos, Aluno).
/* 
  Aluno = joao ? ;
  Aluno = maria ? ;
  os alunos do Professor Carlos são o João e a Maria 
*/

% b - quem são as pessoas da universidade X (alunos ou docentes)?
pertence(Pessoa, Universidade) :- frequenta(Pessoa, Universidade).
pertence(Pessoa, Universidade) :- funcionario(Pessoa, Universidade).
% ?- pertence(Pessoa, feup).
/*
  Pessoa = joao ? ;
  Pessoa = maria ? ;
  Pessoa = ana_paula ? ;
  Pessoa = carlos ? ;
*/

/*
  c - quem é colega de quem?  
  Se Aluno: é colega se for colega de disciplina ou colega de curso ou 
    colega de universidade
  Se professor: é colega se for colega da mesma universidade
*/
colega(Pessoa1, Pessoa2):-
  aluno(Pessoa1, _D),
  aluno(Pessoa2, _D),
  Pessoa1 \= Pessoa2.
colega(Pessoa1, Pessoa2):-
  aluno(Pessoa1, _),
  aluno(Pessoa2, _),
  frequenta(Pessoa1, _F),
  frequenta(Pessoa2, _F),
  Pessoa1 \= Pessoa2.
colega(Pessoa1, Pessoa2):-
  professor(Pessoa1, _),
  professor(Pessoa2, _),
  funcionario(Pessoa1, _F),
  funcionario(Pessoa2, _F),
  Pessoa1 \= Pessoa2.
