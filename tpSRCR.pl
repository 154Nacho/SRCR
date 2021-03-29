% Trabalho Prático SRCR 20/21

:- dynamic utente/10.
:- dynamic centro_saude/5.
:- dynamic staff/4.
:- dynamic vacinacao_Covid/5.

% -------------------------------------------------------
% O Conhecimento pode ser aumentado mas nunca diminuído.
% utente: #Idutente, Nº Segurança_Social, Nome, Data_Nasc, Email, Telefone, Morada, Profissão, [Doenças_Crónicas], #CentroSaúde.
% centro_saude: #Idcentro, Nome, Morada, Telefone, Email.
% staff: #Idstaff, #Idcentro, Nome, email.
% vacinacao_Covid: #Staf, #utente, Data, Vacina, Toma.
% -------------------------------------------------------


% -------------------------------------------------------
% --------------- Base de Conhecimento ------------------
% -------------------------------------------------------

utente(1, 12345678901, 'João da Costa e Campos', 1935-05-03, 'jcc@srcr.pt', '911111111', 'Rua das Adegas Felizes, 12, 1ª Cave', 'Reformado', ['Doenças Cardiovasculares'], 5).
utente(2, 58203459103, 'Josefina Vivida da Paz', 1958-12-02, 'jvp@srcr.pt', 912222222, 'Av dos Castros Reais, 122, 3ºE', 'Professora', ['Asma', 'Diabetes'], 4).
utente(3, 98437219304, 'Ana Santa do Carmo', 1997-08-21, 'asc@srcr.pt', 913333333, 'Travessa do Jacob, 21', 'Estudante', [], 3).
utente(4, 23345886912, 'Jesualdo Peza-Mor', 1963-11-14, 'jpm@srcr.pt', 914444444, 'Estrada do Sossego, Km10', 'Bombeiro', ['Doenças Reumáticas', 'Colesterol'], 2).
utente(5, 67483900221, 'Maria da Trindade Pascoal', 1985-05-05, 'mtp@srcr.pt', 915555555, 'Rua das Adegas da Rua, 15, 10 Esq/T', 'Historiadora', ['Visão'], 1).
utente(6, 34554367887, 'Florindo Teixo Figueirinha', 1974-04-25, 'ftf@srcr.pt', 916666666, 'Autódromo das Vagas, Garagem 123', 'Lojista', ['Hipertensão'], 3).
utente(7, 78990546351, 'Carminho Cunha Bastos', 1960-01-01, 'ccb@srcr.pr', 917777777, 'Rua do Mus-Vitalis, 56, R/C', 'Catequista', ['Parkinson', 'Osteoporose'], 2).
utente(8, 55599911102, 'Francisco Correia Franco', 1999-04-03, 'fcf@srcr.pt', 918888888, 'Rua do Povo, 152', 'Estudante', [], 1).
utente(9, 09876543212, 'Maria Quintas Barros', 1950-12-31, 'mqb@srcr.pt', 919999999, 'Rua do Fragão, 44', 'Pilota de Aviões', ['Diabetes', 'Hipertensão', 'Visão'], 5).
utente(10, 58210227854, 'Maria Beatriz Araújo Lacerda', 1989-07-27, 'mbal@srcr.pt', 921111111, 'Rua do Galo Barcelonete, 136', 'Cabeleireira', ['Doença Pulmonar Obstrutiva'], 4).
utente(11, 01928374657, 'Ana Teresa Gião Gomes', 1947-02-12, 'atgg@srcr.pt', 922222222, 'Rua da Vuvuzela, 158', 'Youtuber', ['Alzheimer', 'Asma'], 5).
utente(12, 34543678769, 'João Manuel Peixe dos Santos', 1978-06-18, 'jmps@srcr.pt', 923333333, 'Rua dos Peixotos, 61, 4ªD', 'Contabilista', ['Doenças Reumáticas', 'Cancro'], 3).
utente(13, 21114599083, 'Paulo Nobre Sousa', 1994-10-10, 'pns@srcr.pt', 924444444, 'Rua dos Móveis Cerrados, 29', 'Engenheiro de Polímeros', [], 5).
utente(14, 88888855555, 'Luís Parente Pacheco Martins', 1964-08-04, 'lppm@srcr.pt', 925555555, 'Rua dos Cabeços Lamparinos, 80', 'Eletricista', ['Doenças Cardiovasculares'], 4).
utente(15, 10000100201, 'Bruno Felipe Enes Diaz', 2000-11-21, 'bfed@srcr.pt', 926666666, 'Rua dos Amareiros Ferrenhos, 137', 'Médico', [], 1).
utente(16, 93330201456, 'Pedro Miguel Ferreira Lemos', 1980-09-26, 'pmfl@srcr.pt', 927777777, 'Rua dos Maçaricos Portenhos, 154', 'Automobilista', ['Doenças Cardiovasculares', 'Visão', 'Hipertensão'], 4).

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

vacinacao_Covid(1, 1, 2021-05-5, 'Pfizer', 1).
vacinacao_Covid(6, 1, 2021-05-19, 'Pfizer', 2).
vacinacao_Covid(2, 2, 2021-04-20, 'Pfizer', 2).
vacinacao_Covid(3, 7, 2021-05-24, 'Astrazeneca', 1). 
vacinacao_Covid(6, 8, 2021-08-15, 'Astrazeneca', 1).
vacinacao_Covid(1, 15, 2021-07-31, 'Astrazeneca', 1).
vacinacao_Covid(2, 14, 2021-06-01, 'Pfizer', 2).

% ----------------------------------------------------------------------------------------------
% ---------Alguns predicados que poderão ser úteis ao longo da realização do trabalho-----------
% ----------------------------------------------------------------------------------------------

% Predicado que verifica se um elemento pertece a uma determinada lista.
% Extensão do predicado pertence: X,Lista -> {V,F}.

pertence(X,[H|T]) :-
	X \= H,
	pertence(X,T).

% Predicado que verifica o contrário de outro predicado.
% Extensão do predicado não: Q -> {V,F}.

nao(Questao) :-
    Questao, !, fail.
nao(Questao).

% Predicado que verifica qual o comprimento de uma lista.
% Extensão do predicado comprimento: Lista,Tamanho -> {V,F}.

comprimento([],0).
comprimento([_|T],S) :-
	comprimento(T,G),
	S is G+1.

% Predicado que cria uma nova lista sem os repetidos da lista original.
% Extensão do predicado semRepetidos: Lista,Lista -> {V,F}.

semRepetidos([],[]).
semRepetidos([H|T],R) :-
	pertence(H,T),
	semRepetidos(T,R).
semRepetidos([H|T],[H|R]) :-
	nao(pertence(H,T)),
	semRepetidos(T,R).

% Predicado que permite a procura de Conhecimento.
% Extensão do predicado procura: Termo,Predicado,Lista -> {V,F}.

procura(T,P,L) :- 
	findall(T,P,L).

% ----------------------------------------------------------------------------------------------
% ---------------------------------------Funcionalidades----------------------------------------
% ----------------------------------------------------------------------------------------------






