% Trabalho Prático SRCR 20/21.

:- dynamic (utente/10).
:- dynamic (centro_saude/5).
:- dynamic (staff/4).
:- dynamic (vacinacao_Covid/5).

% ----------------------------------------------------------------------------------------------
% O Conhecimento pode ser aumentado mas nunca diminuído.
% utente: #Idutente, Nº Segurança_Social, Nome, Data_Nasc, Email, Telefone, Morada, Profissão, [Doenças_Crónicas], #CentroSaúde.
% centro_saude: #Idcentro, Nome, Morada, Telefone, Email.
% staff: #Idstaff, #Idcentro, Nome, email.
% vacinacao_Covid: #Staf, #utente, Data, Vacina, Toma.
% ----------------------------------------------------------------------------------------------

% ----------------------------------------------------------------------------------------------
% Flags iniciais.
% ----------------------------------------------------------------------------------------------

:- style_check(-discontiguous).
:- style_check(-singleton).

% ----------------------------------------------------------------------------------------------
% Definição de Invariantes.
% ----------------------------------------------------------------------------------------------

:- op(900,xfy,'::').

% -------------------------------------------------------
% --------------- Base de Conhecimento ------------------
% -------------------------------------------------------

utente(1, 12345678901, 'João da Costa e Campos', 1935-05-03, 'jcc@srcr.pt', 911111111, 'Rua das Adegas Felizes, 12, 1ª Cave', 'Reformado', ['Doenças Reumáticas','Cancro'], 5). % Elegível para 1ª fase por idade.
utente(17, 22990000000, 'Almira da Cruz Santos', 1910-05-01, 'adcs@srcr.pt', 928888888, 'Rua da Alegria, 1', 'Reformada', [], 1). % Elegível para 1ª fase por idade.
utente(10, 58210227854, 'Maria Beatriz Araújo Lacerda', 1989-07-27, 'mbal@srcr.pt', 921111111, 'Rua do Galo Barcelonete, 136', 'Cabeleireiro', ['Doença Pulmonar Obstrutiva'], 4). % Elegível para 1ª fase por doença.
utente(14, 88888855555, 'Luís Parente Pacheco Martins', 1964-08-04, 'lppm@srcr.pt', 925555555, 'Rua dos Cabeços Lamparinos, 80', 'Eletricista', ['Doenças Cardiovasculares'], 4). % Elegível para 1ª fase por doença.
utente(4, 23345886912, 'Jesualdo Peza-Mor', 1963-11-14, 'jpm@srcr.pt', 914444444, 'Estrada do Sossego, Km10', 'Enfermeiro', ['Doenças Reumáticas', 'Colesterol'], 2). % Elegível para 1ª fase por profissão.
utente(15, 10000100201, 'Bruno Felipe Enes Diaz', 2000-11-21, 'bfed@srcr.pt', 926666666, 'Rua dos Amareiros Ferrenhos, 137', 'Médico', [], 1). % Elegível para 1ª fase por profissão.
utente(16, 93330201456, 'Pedro Miguel Ferreira Lemos', 1980-09-26, 'pmfl@srcr.pt', 927777777, 'Rua dos Maçaricos Portenhos, 154', 'Militar', ['Doenças Cardiovasculares', 'Visão', 'Hipertensão'], 4). % Elegível para 1ª fase por profissão e doença.

utente(2, 58203459103, 'Josefina Vivida da Paz', 1958-12-02, 'jvp@srcr.pt', 912222222, 'Av dos Castros Reais, 122, 3ºE', 'Professor', ['Asma', 'Diabetes'], 4). % Elegível para 2ª fase por idade,profissão e doença.
utente(7, 78990546351, 'Carminho Cunha Bastos', 1960-01-01, 'ccb@srcr.pr', 917777777, 'Rua do Mus-Vitalis, 56, R/C', 'Catequista', ['Parkinson', 'Osteoporose'], 2). % Elegível para 2ª fase por idade.
utente(9, 09876543212, 'Maria Quintas Barros', 1950-12-31, 'mqb@srcr.pt', 919999999, 'Rua do Fragão, 44', 'Piloto de Aviões', ['Diabetes', 'Hipertensão', 'Visão'], 5). % Elegível para 2ª fase por idade e doença.
utente(11, 01928374657, 'Ana Teresa Gião Gomes', 1947-02-12, 'atgg@srcr.pt', 922222222, 'Rua da Vuvuzela, 158', 'Youtuber', ['Alzheimer', 'Asma'], 5). % Elegível para 2ª fase por idade e doença.
utente(3, 98437219304, 'Ana Santa do Carmo', 1997-08-21, 'asc@srcr.pt', 913333333, 'Travessa do Jacob, 21', 'Estudante', [], 3). % Elegível para 2ª fase por profissão.
utente(8, 55599911102, 'Francisco Correia Franco', 1999-04-03, 'fcf@srcr.pt', 918888888, 'Rua do Povo, 152', 'Estudante', [], 1).  % Elegível para 2ª fase por profissão.
utente(12, 34543678769, 'João Manuel Peixe dos Santos', 1978-06-18, 'jmps@srcr.pt', 923333333, 'Rua dos Peixotos, 61, 4ªD', 'Contabilista', ['Obesidade'], 3). % Elegível para 2ª fase por doença.

utente(5, 67483900221, 'Maria da Trindade Pascoal', 1985-05-05, 'mtp@srcr.pt', 915555555, 'Rua das Adegas da Rua, 15, 10 Esq/T', 'Historiador', ['Visão'], 1).
utente(6, 34554367887, 'Florindo Teixo Figueirinha', 1974-04-25, 'ftf@srcr.pt', 916666666, 'Autódromo das Vagas, Garagem 123', 'Lojista', ['Hipertensão'], 3).
utente(13, 21114599083, 'Paulo Nobre Sousa', 1994-10-10, 'pns@srcr.pt', 924444444, 'Rua dos Móveis Cerrados, 29', 'Engenheiro de Polímeros', [], 5).

centro_saude(1, 'Centro de Saúde Mem Martins', 'Rua Pedro Bispo, 725', 951111111, 'csmm@srcr.pt').
centro_saude(2, 'Centro de Saúde Chelas', 'Rua Samuel Mira, 666', 952222222, 'csc@srcr.pt').
centro_saude(3, 'Centro de Saúde São Vítor', 'Rua dos Cabeçudos, 80', 953333333, 'cssv@srcr.pt').
centro_saude(4, 'Centro de Saúde Amares', 'Rua da Lagars, 137', 954444444, 'csa@srcr.pt').
centro_saude(5, 'Centro de Saúde Viena do Forte', 'Rua Anthony Feijó, 154', 955555555, 'csvf@srcr.pt').

staff(1, 5, 'Álvaro de Campos', 'adc@srcr.pt').
staff(2, 4, 'Joaquim Arnaldo Fernandes', 'jaf@srcr.pt').
staff(3, 2, 'Tibúrcio Mantorras', 'tm@srcr.pt').
staff(4, 1, 'Jaime Oliveira', 'jo@srcr.pt').
staff(5, 3, 'Benjamin Otávio Teixeira', 'bot@srcr.pt').
staff(6, 5, 'Sérgio Batedor Oliveira', 'sbo@srcr.pt').

vacinacao_Covid(1, 1, 2021-01-5, 'Pfizer', 1).
vacinacao_Covid(1, 17, 2021-01-5, 'Pfizer', 1).
vacinacao_Covid(1, 10, 2021-01-5, 'Pfizer', 1).
vacinacao_Covid(1, 14, 2021-01-5, 'Pfizer', 1).
vacinacao_Covid(6, 1, 2021-01-19, 'Pfizer', 2).
vacinacao_Covid(2, 2, 2021-01-20, 'Pfizer', 1).

vacinacao_Covid(3, 7, 2021-05-24, 'Astrazeneca', 1).
vacinacao_Covid(3, 7, 2021-05-15, 'Astrazeneca', 2).
vacinacao_Covid(6, 8, 2021-08-15, 'Astrazeneca', 1).
vacinacao_Covid(2, 6, 2021-06-01, 'Pfizer', 1).
vacinacao_Covid(2,6, 2021-06-16, 'Pfizer', 2).

vacinacao_Covid(1, 13, 2021-07-31, 'Astrazeneca', 1).

% ------------------------------------------------------------------------------------------------------------------------------------------
% ---------Alguns predicados que poderão ser úteis ao longo da realização do trabalho que foram retirados de fichas das aulas --------------
% ------------------------------------------------------------------------------------------------------------------------------------------

% ----------------------------------------------------------------------------------------------
% Predicado que verifica se um elemento pertece a uma determinada lista.
% Extensão do predicado pertence: X, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

pertence(H,[H|_T]).
pertence(X,[H|_T]) :-
	X \= H,
pertence(X,_T).

% ----------------------------------------------------------------------------------------------
% Predicado que adiciona um elemento a uma lista.
% Extensão do predicado add: X, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

add(E,L,L) :- pertence(E,L).
add(E, L, [E|L]).

% ----------------------------------------------------------------------------------------------
% Predicado que concatena duas listas.
% Extensão do predicado concat: Lista, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

concat([], L, L).
concat([H|T], L, R) :- add(H, N, R), concat(T, L, N).

% ----------------------------------------------------------------------------------------------
% Predicado que verifica o contrário de outro predicado.
% Extensão do predicado não: Q -> {V,F}.
% ----------------------------------------------------------------------------------------------

nao(Q) :-
    Q, !, fail.
nao(Q).

% ----------------------------------------------------------------------------------------------
% Predicado que verifica qual o comprimento de uma lista.
% Extensão do predicado comprimento: Lista,Tamanho -> {V,F}.
% ----------------------------------------------------------------------------------------------

comprimento([],0).
comprimento([_|T],S) :-
	comprimento(T,G),
	S is G+1.

% ----------------------------------------------------------------------------------------------
% Predicado que verifica qual a maior data entre duas.
% Extensão do predicado data_Maior: Lista,Tamanho -> {V,F}.
% ----------------------------------------------------------------------------------------------

comparaDatas(Y1-M1-D1,Y2-M2-D2,Y1-M1-D1) :- Y2 < Y1;
                                         (Y2 == Y1, M2 < M1);
                                         (Y2 == Y1, M2 == M1, D2 < D1).
comparaDatas(Y1-M1-D1,Y2-M2-D2,Y2-M2-D2) :- Y2 > Y1;
                                         (Y2 == Y1, M2 > M1);
                                         (Y2 == Y1, M2 == M1, D2 >= D1).

% ----------------------------------------------------------------------------------------------
% Predicado que cria uma nova lista sem os repetidos da lista original.
% Extensão do predicado removeRepetidos: Lista,Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

removeRepetidos([],[]).
removeRepetidos([H|T],R) :-
	pertence(H,T),
	removeRepetidos(T,R).
removeRepetidos([H|T],[H|R]) :-
	nao(pertence(H,T)),
	removeRepetidos(T,R).

% ----------------------------------------------------------------------------------------------
% Predicado que permite a procura de Conhecimento.
% Extensão do predicado procura: Termo,Predicado,Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

procura(T,P,L) :-
	findall(T,P,L).

% ----------------------------------------------------------------------------------------------
% Predicado que permite a procura de Conhecimento sem repetidos.
% Extensão do predicado solucoesSRep: Termo, Questão, Resultado -> {V,F}.
% ----------------------------------------------------------------------------------------------

procuraSemRep(X,Y,Z) :-
	setof(X,Y,Z).

% ----------------------------------------------------------------------------------------------
% Predicado que permite a evolução do Conhecimento.
% Extensão do predicado evolução: Termo -> {V,F}.
% ----------------------------------------------------------------------------------------------

evolucao( Termo ) :- procura(Invariante, +Termo::Invariante, Lista),
                     insercao( Termo ),
                     teste( Lista ).

% ----------------------------------------------------------------------------------------------
% Predicado que permite o retrocesso do Conhecimento.
% Extensão do predicado retrocesso: Termo -> {V,F}.
% ----------------------------------------------------------------------------------------------

retrocesso( Termo ) :- procura(Invariante, -Termo::Invariante, Lista),
					   teste( Lista ),
					   remocao( Termo ).

% ----------------------------------------------------------------------------------------------
% Predicado que permite o teste de invariante de uma lista.
% Extensão do predicado teste: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

teste( [] ).
teste( [R|LR] ) :- R, teste( LR ).

% ----------------------------------------------------------------------------------------------
% Predicado que permite a inserção de um termo.
% Extensão do predicado insercao: Termo -> {V,F}.
% ----------------------------------------------------------------------------------------------

insercao(T) :- assert(T).
insercao(T) :- retract(T), !, fail.

% ----------------------------------------------------------------------------------------------
% Predicado que permite a remoção de um termo.
% Extensão do predicado remocao: Termo -> {V,F}.
% ----------------------------------------------------------------------------------------------

remocao(T) :- retract(T).
remocao(T) :- assert(T),!,fail.

% ----------------------------------------------------------------------------------------------
% Predicado que permite a remoção de um tuplo de uma lista de outra lista (Remove os tuplos da segunda lista da primeira lista).
% Extensão do predicado remocao: Lista, Lista, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

eliminaTuplos([], _, []) :- !.
eliminaTuplos([E|T], D, R) :-
    memberchk(E, D), !,
    eliminaTuplos(T, D, R).
eliminaTuplos([H|T], D, [H|R]) :-
    eliminaTuplos(T, D, R).

% ----------------------------------------------------------------------------------------------
% -----------------------------------Invariantes para a remoção---------------------------------
% ----------------------------------------------------------------------------------------------

-utente(Id,Nss,N,D,E,T,M,P,DC,CS):: (procura(Id,utente(Id,Nss,N,D,E,T,M,P,DC,CS),L),
									comprimento(L,R),
									R == 1).

-centro_saude(Id,N,M,T,E):: (procura(Id,centro_saude(Id,N,M,T,E),L),
							comprimento(L,R),
							R == 1).

-staff(Id,Idcs,N,E):: (procura(Id,staff(Id,Idcs,N,E),L),
							comprimento(L,R),
							R == 1).

-vacinacao_Covid(Ids,Idu,D,V,T):: (procura(Idu,vacinacao_Covid(Ids,Idu,D,V,T),L),
									comprimento(L,R),
									R =< 2).

% Não permitir a remoção de utentes e de staff se existirem vacinações de covid a eles associadas.>
-utente(Id,Nss,N,D,E,T,M,P,DC,CS):: (procura(Id,vacinacao_Covid(Ids,Id,D,V,T),L),
									comprimento(L,R),
									R == 0).

-staff(Id,Idcs,N,E):: (procura(Id,vacinacao_Covid(Id,Idu,D,V,T),L),
									comprimento(L,R),
									R == 0).

% ----------------------------------------------------------------------------------------------
% ----------------------------------Invariantes para a inserção---------------------------------
% ----------------------------------------------------------------------------------------------

+utente(Id,_,_,_,_,_,_,_,_,_):: (procura(Id,utente(Id,_,_,_,_,_,_,_,_,_),L),
									comprimento(L,R),
									R == 1).

+centro_saude(Id,_,_,_,_):: (procura(Id,centro_saude(Id,_,_,_,_),L),
							comprimento(L,R),
							R == 1).

+staff(Id,_,_,_):: (procura(Id,staff(Id,_,_,_),L),
							comprimento(L,R),
							R == 1).

+vacinacao_Covid(Ids,Idu,D,_,_):: (procura((Ids,Idu,D),vacinacao_Covid(Ids,Idu,D,_,_),L),
									comprimento(L,R),
									R == 1).

% Ids do utente e do staff têm de existir para inserir uma vacinação.
+vacinacao_Covid(Ids,Idu,D,V,T):: (procura((Ids,Idu),(utente(Idu,_,_,_,_,_,_,_,_,_),staff(Ids,_,_,_)),R),
									comprimento(R,N), N==1).


% tomar a mesma vacina
+vacinacao_Covid(_,Idu,_,V,T):: (
								(T==1;(procura(Idu,(vacinacao_Covid(_,Idu,_,V,_)),R),
								comprimento(R,N),N==2 )
								)).

% toma a segunda depois da primeira
+vacinacao_Covid(_,Idu,_,_,T):: (
								(utente(Idu,_,_,_,_,_,_,_,_,_)),
								qtdVacUtente(Idu,QT), T=<2,
								T =:= QT
								).

% segunda dose depois da primeira
+vacinacao_Covid(_,Idu,A-M-D,_,T)::(
									(T==1;
									(vacinacao_Covid(_,Idu,A2-M2-D2,_,1)),
									T==2,
									(D>D2,M==M2,A==A2;M>M2,A==A2;A>A2)
									)).

% ----------------------------------------------------------------------------------------------
% ---------------------------------------Funcionalidades----------------------------------------
% ----------------------------------------------------------------------------------------------

qtdVacUtente(Id,QT):- procura(Id,(vacinacao_Covid(_,Id,_,_,_)),R),comprimento(R,QT).

% ----------------------------------------------------------------------------------------------
% Predicado que regista Utentes.
% Extensão do predicado registarUtente: Id_Utente, Número de Segurança_Social, Nome, Data Nascimento, Email, Telefone, Morada, Profissão, [Doenças_Crónicas], CentroSaúde -> {V,F}.
% ----------------------------------------------------------------------------------------------

registarUtente(Id,Nss,N,D,E,T,M,P,DC,CS) :-
	evolucao(utente(Id,Nss,N,D,E,T,M,P,DC,CS)).

% ----------------------------------------------------------------------------------------------
% Predicado que regista Centros de Saúde.
% Extensão do predicado registarCentro: Id_Centro, Nome, Morada, Telefone, Email -> {V,F}.
% ----------------------------------------------------------------------------------------------

registarCentro(Id,N,M,T,E) :-
	evolucao(centro_saude(Id,N,M,T,E)).

% ----------------------------------------------------------------------------------------------
% Predicado que regista Staffs.
% Extensão do predicado registarStaff: Id_Staff, Id_Centro, Nome, Email -> {V,F}.
% ----------------------------------------------------------------------------------------------

registarStaff(Id,Idcs,N,E) :-
	evolucao(staff(Id,Idcs,N,E)).

% ----------------------------------------------------------------------------------------------
% Predicado que regista Vacinações de Covid.
% Extensão do predicado registarVacinacao: Id_Staff, Id_Utente, Data, Vacina, Toma -> {V,F}.
% ----------------------------------------------------------------------------------------------

registarVacinacao(Ids,Idu,D,V,T) :-
	evolucao(vacinacao_Covid(Ids,Idu,D,V,T)).

% ----------------------------------------------------------------------------------------------
% Predicado que remove Utentes.
% Extensão do predicado removerUtente: Id_Utente, Número de Segurança_Social, Nome, Data Nascimento, Email, Telefone, Morada, Profissão, [Doenças_Crónicas], CentroSaúde -> {V,F}.
% ----------------------------------------------------------------------------------------------

removerUtentes(Id,Nss,N,D,E,T,M,P,DC,CS) :-
	retrocesso(utente(Id,Nss,N,D,E,T,M,P,DC,CS)).

% ----------------------------------------------------------------------------------------------
% Predicado que remove Centros de Saúde.
% Extensão do predicado removerCentros: Id_Centro, Nome, Morada, Telefone, Email -> {V,F}.
% ----------------------------------------------------------------------------------------------

removerCentros(Id) :-
	retrocesso(centro_saude(Id,N,M,T,E)).

% ----------------------------------------------------------------------------------------------
% Predicado que remove Staff.
% Extensão do predicado removerStaff: Id_Staff, Id_Centro, Nome, Email -> {V,F}.
% ----------------------------------------------------------------------------------------------

removerStaff(Id) :-
	retrocesso(staff(Id,Idcs,N,E)).

% ----------------------------------------------------------------------------------------------
% Predicado que remove Vacinações de Covid.
% Extensão do predicado removerVacinacao: Id_Staff, Id_Utente, Data, Vacina, Toma -> {V,F}.
% ----------------------------------------------------------------------------------------------

removerVacinacao(Ids,Idu,D) :-
	retrocesso(vacinacao_Covid(Ids,Idu,D,V,T)).

% ----------------------------------------------------------------------------------------------
% Predicado que retorna os staffs que trabalham num determinado centro de saúde.
% Extensão do predicado getStaffCS: Id_Centro, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

getStaffCS(CS,V) :-
	procura(Nome,staff(_,CS,Nome,_),V).

% ----------------------------------------------------------------------------------------------
% Predicado que retorna os utentes que estão associados a um determinado centro de saúde.
% Extensão do predicado getUtenteCS: Id_Centro, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

getUtenteCS(CS,V) :-
	procura(Nome,utente(_,_,Nome,_,_,_,_,_,_,CS),V).

% ----------------------------------------------------------------------------------------------
% Predicado que retorna o número de vacinações feitas na 1ª fase de Vacinação.
% Extensão do predicado numeroVacinacoesfase1: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

numeroVacinacoesfase1(V) :- 
	procura(Id,(vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-01-01,D,D),comparaDatas(2021-03-31,D,2021-03-31)),L),
	comprimento(L,T),
	V is T.

% ----------------------------------------------------------------------------------------------
% Predicado que retorna o número de vacinações feitas na 2ª fase de Vacinação.
% Extensão do predicado numeroVacinacoesfase2: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

numeroVacinacoesfase2(V) :- 
	procura(Id,(vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-04-01,D,D),comparaDatas(2021-07-31,D,2021-07-31)),L),
	comprimento(L,T),
	V is T.

% ----------------------------------------------------------------------------------------------
% Predicado que retorna o número de pessoas vacinadas na 1ª fase de Vacinação.
% Extensão do predicado numeroPessoasVacinadasfase1: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

numeroPessoasVacinadasfase1(V) :- 
	procura(Id,(vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-01-01,D,D),comparaDatas(2021-03-31,D,2021-03-31)),V1),
	removeRepetidos(V1,L),
	comprimento(L,T),
	V is T.

% ----------------------------------------------------------------------------------------------
% Predicado que retorna o número de pessoas vacinadas na 2ª fase de Vacinação.
% Extensão do predicado numeroPessoasVacinadasfase2: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

numeroPessoasVacinadasfase2(V) :- 
	procura(Id,(vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-04-01,D,D),comparaDatas(2021-07-31,D,2021-07-31)),V1),
	removeRepetidos(V1,L),
	comprimento(L,T),
	V is T.

% ----------------------------------------------------------------------------------------------
% Predicado que retorna as vacinações feitas entre duas datas.
% Extensão do predicado vacinacaoEntreDatas: Data, Data, Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

datasLimiteVacinacao(D1,D2,V) :-
	comparaDatas(D1,V,V),comparaDatas(D2,V,D2).

vacinacaoEntreDatas(D1,D2,V) :-
	procura((Ids,Idu,D,M,T),(vacinacao_Covid(Ids,Idu,D,M,T),datasLimiteVacinacao(D1,D2,D)),L),
	removeRepetidos(L,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na primeira fase.
% Extensão do predicado fase1_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

fase1_vacinacao(V) :-
	idade1_fase_vacinacao(I),
	profissao1_fase_vacinacao(P),
	concat(I,P,L),
	doencas1_fase_vacinacao(D),
	concat(L,D,V1),
	removeRepetidos(V1,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na primeira fase devido à sua idade.
% Extensão do predicado idade1_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

idade1_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,D,_,_,_,_,_,_),comparaDatas(1942-01-01,D,1942-01-01)),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na primeira fase devido à sua profissão.
% Extensão do predicado profissao1_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

profissao1_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,P,_,_),(P == 'Médico';P == 'Enfermeiro';P == 'Militar')),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na primeira fase devido às suas doenças crónicas.
% Extensão do predicado doencas1_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

doencas1_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,L,_),(pertence('Doença Pulmonar Obstrutiva',L);pertence('Doenças Cardiovasculares',L))),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na segunda fase.
% Extensão do predicado fase2_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

fase2_vacinacao(V) :-
	fase1_vacinacao(F),
	idade2_fase_vacinacao(I),
	profissao2_fase_vacinacao(P),
	concat(I,P,L),
	doencas2_fase_vacinacao(D),
	concat(L,D,V1),
	removeRepetidos(V1,V2),
	eliminaTuplos(V2,F,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na segunda fase devido à sua idade.
% Extensão do predicado idade2_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

idade2_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,D,_,_,_,_,_,_),comparaDatas(1972-01-01,D,1972-01-01),comparaDatas(1942-01-01,D,D)),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na segunda fase devido à sua profissão.
% Extensão do predicado profissao2_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

profissao2_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,P,_,_),(P == 'Professor';P == 'Estudante')),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas elegíveis para vacinação na segunda fase devido às suas doenças crónicas.
% Extensão do predicado doencas2_fase_vacinacao: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

doencas2_fase_vacinacao(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,L,_),(pertence('Diabetes',L);pertence('Obesidade',L);pertence('Asma',L);pertence('Cancro',L))),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas vacinadas.
% Extensão do predicado vacinados: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

vacinados(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,_,_,2)),V1),
	removeRepetidos(V1,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas a quem falta a segunda toma da vacina.
% Extensão do predicado vacinadosPrimeiraToma: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

vacinadosPrimeiraToma(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,_,_,1),nao(vacinacao_Covid(_,Id,_,_,2))),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas não vacinadas.
% Extensão do predicado naoVacinados: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

naoVacinados(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),nao(vacinacao_Covid(_,Id,_,_,_))),V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas mal vacinadas na 1ª fase.
% Extensão do predicado malVacinadosfase1: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

malVacinadosfase1(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-01-01,D,D),comparaDatas(2021-03-31,D,2021-03-31)),V1),
	removeRepetidos(V1,V2),
	fase1_vacinacao(L),
	concat(V2,L,V3),
	eliminaTuplos(V3,L,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas mal vacinadas na 2ª fase.
% Extensão do predicado malVacinadosfase2: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------

malVacinadosfase2(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-04-01,D,D),comparaDatas(2021-07-31,D,2021-07-31)),V1),
	removeRepetidos(V1,V2),
	fase2_vacinacao(L),
	concat(V2,L,V3),
	eliminaTuplos(V3,L,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas não vacinadas e que são candidatas a vacinação na 1ª fase.
% Extensão do predicado candidatosVacinacaofase1: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------	

candidatosVacinacaofase1(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-01-01,D,D),comparaDatas(2021-03-31,D,2021-03-31)),V1),
	removeRepetidos(V1,V2),
	fase1_vacinacao(F),
	eliminaTuplos(F,V2,V).

% ----------------------------------------------------------------------------------------------
% Predicado que identifica as pessoas não vacinadas e que são candidatas a vacinação na 2ª fase.
% Extensão do predicado candidatosVacinacaofase2: Lista -> {V,F}.
% ----------------------------------------------------------------------------------------------	

candidatosVacinacaofase2(V) :-
	procura((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_),vacinacao_Covid(_,Id,D,_,_),comparaDatas(2021-04-01,D,D),comparaDatas(2021-07-31,D,2021-07-31)),V1),
	removeRepetidos(V1,V2),
	fase2_vacinacao(F),
	eliminaTuplos(F,V2,V).