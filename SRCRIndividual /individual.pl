:- op( 900,xfy,'::' ).
:- use_module(library(lists)).

:- include('pontos_recolha.pl').
:- include('arcos.pl').

% --------------------------------------------------- Predicados das Aulas -----------------------------------------------------------     

nao( Questao ) :-
    Questao, !, fail.
nao( _ ).

membro(X, [X|_]).
membro(X, [_|Xs]):-
	membro(X, Xs).

comprimento(S,N) :- length(S,N).

estaVazia(L,V) :- comprimento(L,V),nao(V>0).

imprime([]).
imprime([X|T]) :- write(X), nl, imprime(T).

getLocalTipo(Local,Tipo) :- pontos_recolha(_, _, Local, Tipo, _, _).
getArco(Origem,Destino,Dist) :- arco(Origem,Destino,Dist).

adjacente(Origem, Destino, Custo) :- getArco(Origem, Destino, Custo).
adjacente(Origem, Destino, Custo) :- getArco(Destino, Origem, Custo).

minimo(L, (A,B)) :-
    select((A,B), L, R),
    \+ ( member((A1,B1), R), B1 < B ).
             
% --------------------------------------------------- Trabalho Individual -----------------------------------------------------------    

inicial('R do Alecrim').

final('Av 24 de Julho').

% --------------------------------------------------- Procura Não Informada ----------------------------------------------------------- 

% --------------------------------------------------- DFS - Profundidade (em termos de números de arcos) ----------------------------------------------------------- 

solveDepthFirst([Nodo|Caminho]):-
    inicial(Nodo),
    depthFirst(Nodo,[Nodo],Caminho).

depthFirst(Nodo,_,[]):-
    final(Nodo).

depthFirst(Nodo,Historico,[NodoProx|Caminho]):-
    adjacente(Nodo,NodoProx,_),
    nao(membro(NodoProx,Historico)),
    depthFirst(NodoProx,[NodoProx|Historico],Caminho).

solveDepthFirstAll(L):-
    findall((S,C),(solveDepthFirst(S),comprimento(S,C)),L).

bestSolutionDepthFirst(Nodo,Caminho,NArcos):-
    findall((S,C),(solveDepthFirst(S),comprimento(S,C)),L), minimo(L,(Caminho,NArcos)).

solveDepthFirstT([Nodo|Caminho], Tipo):-
    inicial(Nodo),
    depthFirstT(Nodo,[Nodo],Caminho, Tipo).

depthFirstT(Nodo,_,[], Tipo):-
    final(Nodo).

depthFirstT(Nodo,Historico,[NodoProx|Caminho], Tipo):-
    getLocalTipo(NodoProx, Tipo),
    adjacente(Nodo,NodoProx,_),
    nao(membro(NodoProx,Historico)),
    depthFirstT(NodoProx,[NodoProx|Historico],Caminho, Tipo).

solveDepthFirstTAll(L,T):-
    findall((S,C),(solveDepthFirstT(S,T),comprimento(S,C)),L).


% --------------------------------------------------- DFS - Profundidade (em termos de capacidades(distâncias)) -----------------------------------------------------------

solveDepthFirstC([Nodo|Caminho],Custo):-
    inicial(Nodo),
    depthFirstC(Nodo,[Nodo],Caminho,Custo).

depthFirstC(Nodo,_,[],0):-
    final(Nodo).

depthFirstC(Nodo,Historico,[NodoProx|Caminho],Custo):-
    adjacente(Nodo,NodoProx,CustoArco),
    nao(membro(NodoProx,Historico)),
    depthFirstC(NodoProx,[NodoProx|Historico],Caminho,CustoAux),
    Custo is CustoArco+CustoAux.

solveDepthFirstCAll(L):-
    findall((S,C),(solveDepthFirstC(S,C)),L).

bestSolutionDepthFirstC(Nodo,Caminho,Custo):-
    findall((S,C),(solveDepthFirstC(S,C)),L),minimo(L,(Caminho,Custo)).

solveDepthFirstCT([Nodo|Caminho],Custo, Tipo):-
    inicial(Nodo),
    depthFirstCT(Nodo,[Nodo],Caminho,Custo,Tipo).

depthFirstCT(Nodo,_,[],0,Tipo):-
    final(Nodo).

depthFirstCT(Nodo,Historico,[NodoProx|Caminho],Custo,Tipo):-
    getLocalTipo(NodoProx,Tipo),
    adjacente(Nodo,NodoProx,CustoArco),
    nao(membro(NodoProx,Historico)),
    depthFirstCT(NodoProx,[NodoProx|Historico],Caminho,CustoAux,Tipo),
    Custo is CustoArco+CustoAux.

solveDepthFirstCTAll(L,T):-
    findall((S,C),(solveDepthFirstCT(S,C,T)),L).

% --------------------------------------------------- BFS - Largura (em termos de números de arcos) ----------------------------------------------------------- 

solveBreadthFirst(Nodo,Solucao):-
    inicial(Nodo),
    breadthFirst([[Nodo]],Solucao).

breadthFirst([[Nodo|Caminho]|_],[Nodo|Caminho]):-
    final(Nodo).

breadthFirst([Caminho|Caminhos],Solucao):-
    extend(Caminho,NovosCaminhos),
    append(Caminhos,NovosCaminhos,CaminhosAux),
    breadthFirst(CaminhosAux,Solucao).

extend([Nodo|Caminho],NovosCaminhos):-
    findall([NovoNodo,Nodo|Caminho],
        (adjacente(Nodo,NovoNodo,_), nao(membro(NovoNodo,[Nodo|Caminho]))),
        NovosCaminhos).

solveBreadthFirstAll(L):-
    findall((S,C),(solveBreadthFirst(N,S),comprimento(S,C)),L).

bestSolutionBreadthFirst(Nodo,Caminho,NArcos):-
    findall((S,C),(solveBreadthFirst(N,S),comprimento(S,C)),L), minimo(L,(Caminho,NArcos)).

% --------------------------------------------------- DFLimited - Profundidade (em termos de número de arcos) -----------------------------------------------------------

solveDFLimited(Solucao,L) :-
    inicial(Nodo),
    dFLimited([],Nodo,SolucaoAux,L),
    reverse(SolucaoAux,Solucao).

dFLimited(Caminho,Nodo,[Nodo|Caminho],_) :-
    final(Nodo),!.

dFLimited(Caminho,Nodo,S,L) :-
    L > 0,
    adjacente(Nodo,NodoProx,_),
    nao(membro(NodoProx,Caminho)),
    L1 is L - 1,
    dFLimited([Nodo|Caminho],NodoProx,S,L1).

solveDFLimitedAll(L,Size):- 
    findall((S,C),(solveDFLimited(S,Size),comprimento(S,C)), L).

bestSolutionDFLimited(Nodo,Caminho,NArcos,Size):-
    findall((S,C),(solveDFLimited(S,Size),comprimento(S,C)),L), minimo(L,(Caminho,NArcos)).

solveDFLimitedT(Solucao,L,Tipo) :-
    inicial(Nodo),
    dFLimitedT([],Nodo,SolucaoAux,L,Tipo),
    reverse(SolucaoAux,Solucao).

dFLimitedT(Caminho,Nodo,[Nodo|Caminho],_,Tipo) :-
    final(Nodo),!.

dFLimitedT(Caminho,Nodo,S,L,Tipo) :-
    getLocalTipo(NodoProx,Tipo),
    L > 0,
    adjacente(Nodo,NodoProx,_),
    nao(membro(NodoProx,Caminho)),
    L1 is L - 1,
    dFLimitedT([Nodo|Caminho],NodoProx,S,L1,Tipo).

solveDFLimitedAllT(L,Size,Tipo):- 
    findall((S,C),(solveDFLimitedT(S,Size,Tipo),comprimento(S,C)), L).

% --------------------------------------------------- DFLimited - Profundidade (em termos de capacidades(distâncias)) -----------------------------------------------------------

solveDFLimitedC(Solucao,L,Custo) :-
    inicial(Nodo),
    dFLimitedC([],Nodo,SolucaoAux,L,Custo),
    reverse(SolucaoAux,Solucao).

dFLimitedC(Caminho,Nodo,[Nodo|Caminho],L,0) :-
    final(Nodo),!.

dFLimitedC(Caminho,Nodo,S,L,Custo) :-
    L > 0,
    adjacente(Nodo,NodoProx,CustoArco),
    nao(membro(NodoProx,Caminho)),
    L1 is L - 1,
    dFLimitedC([Nodo|Caminho],NodoProx,S,L1,CustoAux),
    Custo is CustoArco + CustoAux.

solveDFLimitedCAll(L,Size):-
    findall((S,C,Cost),(solveDFLimitedC(S,Size,Cost)),L).

bestSolutionDFLimitedC(Nodo,Caminho,Custo,Size):-
    findall((S,C),(solveDFLimitedC(S,Size,C)),L),minimo(L,(Caminho,Custo)).

solveDFLimitedCT(Solucao,L,Custo,Tipo) :-
    inicial(Nodo),
    dFLimitedCT([],Nodo,SolucaoAux,L,Custo,Tipo),
    reverse(SolucaoAux,Solucao).

dFLimitedCT(Caminho,Nodo,[Nodo|Caminho],L,0,Tipo) :-
    final(Nodo),!.

dFLimitedCT(Caminho,Nodo,S,L,Custo,Tipo):-
    getLocalTipo(NodoProx,Tipo),
    L > 0,
    adjacente(Nodo,NodoProx,CustoArco),
    nao(membro(NodoProx,Caminho)),
    L1 is L - 1,
    dFLimitedCT([Nodo|Caminho],NodoProx,S,L1,CustoAux,Tipo),
    Custo is CustoArco + CustoAux.

solveDFLimitedCTAll(L,Size,Tipo):-
    findall((S,C,Cost),(solveDFLimitedCT(S,Size,Cost,Tipo)),L).

% --------------------------------------------------- Procura Informada ----------------------------------------------------------- 

% --------------------------------------------------- Gulosa ----------------------------------------------------------- 

solveGulosa(Nodo,Caminho/Custo):-
    estimativa(Nodo,Estimativa),
    agulosa([[Nodo]/0/Estimativa],CaminhoInverso/Custo/_),
    reverse(CaminhoInverso,Caminho).

agulosa(Caminhos,Caminho):-
    obtem_melhor_g(Caminhos,Caminho),
    Caminho = [Nodo|_]/_/_,final(Nodo).

agulosa(Caminhos,SolucaoCaminho):-
    obtem_melhor_g(Caminhos, MelhorCaminho),
    mySelect(MelhorCaminho, Caminhos, OutrosCaminhos),
    expandeGulosa(MelhorCaminho,ExpCaminhos),
    append(OutrosCaminhos,ExpCaminhos,NovoCaminhos),
    agulosa(NovoCaminhos,SolucaoCaminho).

obtem_melhor_g([Caminho],Caminho):- !.

obtem_melhor_g([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos],MelhorCaminho):-
	Est1 =< Est2, !,
	obtem_melhor_g([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho).

obtem_melhor_g([_|Caminhos],MelhorCaminho):- 
	obtem_melhor_g(Caminhos,MelhorCaminho).

expandeGulosa(Caminho,ExpCaminhos):-
	findall(NovoCaminho,adjacenteG(Caminho,NovoCaminho),ExpCaminhos).

adjacenteG([Nodo|Caminho]/Custo/_,[ProxNodo,Nodo|Caminho]/NovoCusto/Est):-
	adjacente(Nodo,ProxNodo,PassoCusto),
    nao(membro(ProxNodo,Caminho)),
	NovoCusto is Custo+PassoCusto,
	estimativa(ProxNodo,Est).

estimativa(Nodo,Est):-
    distance(Nodo,Est).

distance(Origem,Dist):-
    pontos_recolha(Lat1,Lon1,Origem,_,_,_),
    final(Destino),
    pontos_recolha(Lat2,Lon2,Destino,_,_,_),
    P is 0.017453292519943295,
    A is (0.5 - cos((Lat2 - Lat1) * P) / 2 + cos(Lat1 * P) * cos(Lat2 * P) * (1 - cos((Lon2 - Lon1) * P)) / 2),
    Dist is (12742 * asin(sqrt(A))).

mySelect(E,[E|Xs],Xs).
mySelect(E,[X|Xs],[X|Ys]):- 
    mySelect(E,Xs,Ys).

solveGulosaT(Nodo,Caminho/Custo,Tipo):-
    estimativa(Nodo,Estimativa),
    agulosaT([[Nodo]/0/Estimativa],CaminhoInverso/Custo/_,Tipo),
    reverse(CaminhoInverso,Caminho).

agulosaT(Caminhos,Caminho,Tipo):-
    obtem_melhor_g(Caminhos,Caminho),
    Caminho = [Nodo|_]/_/_,final(Nodo).

agulosaT(Caminhos,SolucaoCaminho,Tipo):-
    obtem_melhor_g(Caminhos, MelhorCaminho),
    mySelect(MelhorCaminho, Caminhos, OutrosCaminhos),
    expandeGulosaT(MelhorCaminho,ExpCaminhos,Tipo),
    append(OutrosCaminhos,ExpCaminhos,NovoCaminhos),
    agulosaT(NovoCaminhos,SolucaoCaminho,Tipo).

expandeGulosaT(Caminho,ExpCaminhos,Tipo):-
	findall(NovoCaminho,adjacenteGT(Caminho,NovoCaminho,Tipo),ExpCaminhos).

adjacenteGT([Nodo|Caminho]/Custo/_,[ProxNodo,Nodo|Caminho]/NovoCusto/Est,Tipo):-
    getLocalTipo(NodoProx,Tipo),
	adjacente(Nodo,ProxNodo,PassoCusto),
    nao(membro(ProxNodo,Caminho)),
	NovoCusto is Custo+PassoCusto,
	estimativa(ProxNodo,Est).

% --------------------------------------------------- A* (A Estrela) ----------------------------------------------------------- 

solveAEstrela(Caminho/Custo):-
    inicial(Nodo),
    pontos_recolha(_,_,Nodo,_,Cap,_),
    aEstrela([[Nodo]/0/pontos_recolha], CaminhoInverso/Custo/_),
    reverse(CaminhoInverso, Caminho).

aEstrela(Caminhos, Caminho):-
    obtem_melhor(Caminhos, Caminho),
    Caminho = [Nodo|_]/_/_,
    final(Nodo).

aEstrela(Caminhos, SolucaoCaminho):-
    obtem_melhor(Caminhos, MelhorCaminho),
    mySelect(MelhorCaminho, Caminhos, OutrosCaminhos),
    expandAEstrela(MelhorCaminho, ExpCaminhos),
    append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
    aEstrela(NovoCaminhos, SolucaoCaminho).

obtem_melhor([Caminho],Caminho):- !.

obtem_melhor([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho):-
    Custo1 + Est1 =< Custo2 + Est2, !,
    obtem_melhor([Caminho1/Custo1/Est1|Caminhos],MelhorCaminho).
    
obtem_melhor([_|Caminhos],MelhorCaminho):- 
    obtem_melhor(Caminhos,MelhorCaminho).
    
expandAEstrela(Caminho,ExpCaminhos):-
    findall(NovoCaminho,adjacenteG(Caminho,NovoCaminho),ExpCaminhos).