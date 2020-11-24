:- use_module(library(lists)).

ligado(a,b). 
ligado(b,d).
ligado(a,c).
ligado(b,e).
ligado(b,f).
ligado(c,g). 
ligado(d,h). 
ligado(d,i).
ligado(f,i). 
ligado(f,j).
ligado(f,k).
ligado(g,l).
ligado(g,m).
ligado(k,n). 
ligado(l,o). 
ligado(i,f). 

/**
 * Ni - nó inicial
 * Nf - nó final
 * P - (Path) Lista de nós por onde passa
 * Fp - (Final Path) Lista final
 * e.g prof(a, n, L).
*/
prof(Ni, Nf, P):-
    pesq_prof(Ni, Nf, [], P).

pesq_prof(Nf, Nf, P, Fp):-
    Fp = P.
pesq_prof(Ni, Nf, P, Fp):-
    ligado(Ni, Nm),
    \+ member(Nm, P),
    append(P,[Nm], Pr),
    pesq_prof(Nm, Nf, Pr, Fp).

% Acha todos os X onde Y esta satisfeito e retorna numa lista Y 
ache_todos(X, Y, Z):- bagof(X, Y, Z), !. 
ache_todos(_, _, []). 
% Estende a fila ate um filho N1 de N, verificando se N1  
% não pertence à fila, prevenindo, assim, ciclos 
estende_ate_filho([N|Trajectoria], [N1,N|Trajectoria]):-  
    ligado(N,N1),            
    \+ member(N1, Trajectoria). 
% Encontra o caminho Solucao entre No_inicial e No_Meta 
resolva_larg(No_inicial, No_meta, Solucao):-       
    largura([[No_inicial]], No_meta, Sol1),       
    reverse(Sol1, Solucao).      
% Realiza a pesquisa em largura 
largura([[No_meta|T]|_],No_meta,[No_meta|T]).      
largura([T|Fila],No_meta,Solucao):-      
    ache_todos(ExtensaoAteFilho,
    estende_ate_filho(T,ExtensaoAteFilho),Extensoes),    
    append(Fila, Extensoes, FilaExtendida),    
    largura(FilaExtendida, No_meta, Solucao).