:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('restricoes.pl').

slot(1,	 0).
slot(2,	 0.5).
slot(3,	 1).
slot(4,	 1.5).
slot(5,	 2).
slot(6,	 2.5).
slot(7,	 3).
slot(8,	 3.5).
slot(9,	 4).
slot(10, 4.5).
slot(11, 5).
slot(12, 5.5).
slot(13, 6).
slot(14, 6.5).
slot(15, 7).
slot(16, 7.5).
slot(17, 8).
slot(18, 8.5).
slot(19, 9).
slot(20, 9.5).
slot(21, 10).
slot(22, 10.5).
slot(23, 11).
slot(24, 11.5).
slot(25, 12).
slot(26, 12.5).
slot(28, 13).
slot(29, 13.5).
slot(30, 14).
slot(31, 14.5).
slot(32, 15).
slot(33, 15.5).
slot(34, 16).
slot(35, 16.5).
slot(36, 17).
slot(37, 17.5).
slot(38, 18).
slot(39, 18.5).
slot(40, 19).
slot(41, 19.5).
slot(42, 20).
slot(43, 20.5).
slot(44, 21).
slot(45, 21.5).
slot(46, 22).
slot(47, 22.5).
slot(48, 23).
slot(49, 23.5).
slot(50, 24).

diaSemana(1, 'Segunda Feira').
diaSemana(2, 'Terca Feira').
diaSemana(3, 'Quarta Feira').
diaSemana(4, 'Quinta Feira').
diaSemana(5,'Sexta Feira').
diaSemana(6, 'Sabado').
diaSemana(7, 'Domingo').

%indice, nome, custo, duração, horario obrigatório
serie(1, 'batman1', 40000, 2, X):- horarioMatinal(X).
serie(2, 'batman2', 40000, 3, X):- horarioMatinal(X).
serie(3, 'batman3', 50000, 2, X):- horarioNormal(X).
serie(4, 'batman4', 20000, 1, X):- horarioNormal(X).
serie(5, 'batman5', 50000, 1, X):- horarioNoturno(X).
serie(6, 'batman6', 20000, 2, X):- horarioNormal(X).
serie(7, 'batman7', 50000, 5, X):- horarioNormal(X).
serie(8, 'batman8', 50000, 6, X):- horarioNoturno(X).
serie(9, 'batman9', 50000, 3, X):- horarioNormal(X).
serie(10, 'batman10', 50000, 1, X):- horarioNormal(X).
serie(11, 'batman11', 50000, 1, X):- horarioNormal(X).
serie(12, 'batman12', 50000, 1, X):- horarioNormal(X).
serie(13, 'batman13', 50000, 2, X):- horarioNormal(X).
/*serie(14, 'batman14', 50000, 3, X):- horarioNoturno(X).
serie(15, 'batman15', 50000, 1, X):- horarioNoturno(X).
serie(16, 'batman16', 50000, 2, X):- horarioNoturno(X).
serie(17, 'batman17', 50000, 1, X):- horarioNoturno(X).
serie(18, 'batman18', 50000, 4, X):- horarioNoturno(X).
serie(19, 'batman19', 50000, 3, X):- horarioNoturno(X).
*/

%contrato(A, B), A nao pode ser exibido no mesmo dia que B
contrato(10,11).
contrato(11,12).
contrato(7,11).
contrato(13,10).

%votos dos utilizadores
%voto(IdSerie, IdDia, IdHrario)
voto(1, 1, 44).
voto(1, 1, 44).
voto(1, 1, 44).
voto(1, 2, 45).
voto(1, 2, 45).
voto(1, 2, 23).
voto(1, 2, 37).
voto(1, 2, 45).
voto(1, 2, 1).
voto(1, 2, 1).

voto(2, 1, 44).
voto(2, 1, 44).
voto(2, 2, 44).
voto(2, 2, 45).

voto(3, 1, 44).
voto(3, 1, 40).
voto(3, 2, 44).
voto(3, 2, 45).

voto(4, 1, 20).
voto(4, 1, 21).
voto(4, 2, 22).
voto(4, 2, 10).

voto(5, 1, 20).
voto(5, 1, 22).
voto(5, 2, 22).
voto(5, 2, 22).

voto(6, 1, 21).
voto(6, 1, 21).
voto(6, 2, 21).
voto(6, 2, 21).

voto(7, 1, 44).
voto(7, 1, 38).
voto(7, 2, 19).
voto(7, 2, 45).

voto(8, 1, 21).
voto(8, 1, 12).
voto(8, 2, 10).
voto(8, 2, 45).

voto(9, 1, 44).
voto(9, 2, 44).
voto(9, 2, 44).
voto(9, 2, 45).

voto(10, 2, 44).
voto(10, 2, 44).
voto(10, 2, 44).
voto(10, 2, 45).

% -X: lista dos horarios da noite
horarioMatinal([16, 17, 18, 19, 20, 21, 22, 23, 24]).
horarioNoturno([1, 2, 3, 4, 5, 6, 7, 8, 9, 48, 49, 50]).
horarioNormal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
				  11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
				  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
				  31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
				  41, 42, 43, 44, 45, 46, 47, 48, 49, 50]).
				  

projeto(Ss, Es, Ms) :-
	createSeries(Series, SriesCusto, Ss, Es, Ms),
	
	domain(Ss, 16, 22), %tempos iniciais
    domain(Es, 17, 23), %tempos finais
    domain(Ms, 1, 3), %id dos dias
	CustoTotal in 0 .. 9999999,
	%cada maquina é um dia á exeção da ultima maquina
    Dias = [
        machine(1, 1),
		machine(2, 1),
        machine(3, 100) %só para caberem todos os outros que não foram para o ar
    ],
	
	%restricoes
	diasSemVazios(Dias, Series, 6),
	horarioSuposto(Series),
	restricaoContratual(Series),
	
	
	custoTotal(SriesCusto, 1, CustoTotal),
    cumulatives(Series, Dias, [bound(upper)]),
    append([Ms, Ss, [CustoTotal] ], Vars),

    labeling([minimize(CustoTotal)], Vars), write('custo Total: '), write(CustoTotal), nl,
	printSeriesDias(Series, Dias).
	
%faz o print de séries nos dias
printSeriesDias(_, [machine(_,_)]).
printSeriesDias(Series, [ machine(IdDia,_) |Dias]) :-
	diaSemana(IdDia, NomeDoDia),
	write('Series de '), write(NomeDoDia), write(':'),nl,
	printSeries(Series, IdDia, 1),
	printSeriesDias(Series, Dias), !.

%faz o print das séries apenas num dia
printSeries(Series, _, Acm) :-
	Acm1 is Acm - 1,
	length(Series, Acm1), !.

printSeries(Series, Dia, Acm) :-
	nth1(Acm, Series, task(IdInicio, _,  IdFim,  _, Dia)),
	slot(IdInicio, Inicio),
	slot(IdFim, Fim),
	serie(Acm, Nome, _, _, _),
	write('    -'), write(Nome), write(' das '), write(Inicio), write(' as '), write(Fim), nl,
	Acm1 is Acm + 1,
	printSeries(Series, Dia, Acm1), !.
	
printSeries(Series, Dia, Acm) :-
	Acm1 is Acm + 1,
	printSeries(Series, Dia, Acm1), !.
	
	
%passa por todas as séries
createSeries(Sries, SriesCusto, TempoIni, TempoFinal, IdsMaquinas) :-
    createSeries([], Sries, SriesCusto, TempoIni, TempoFinal, IdsMaquinas).

createSeries(Acc, Sries, SriesCusto, TempoIni, TempoFinal, IdsMaquinas) :-
    serie(Id, _, Custo, Duracao, _),
    \+ member(Id, Acc), !,
    createSeries([Id|Acc], Sries1, SriesCusto1, TempoIni1, TempoFinal1, IdsMaquinas1),
	
	Sries = [ task(S1, Duracao,  E1,  1, M1) | Sries1],
	SriesCusto = [ [S1, Duracao, M1, Custo] | SriesCusto1],
	TempoIni = [S1 | TempoIni1],
	TempoFinal = [E1|TempoFinal1],
	IdsMaquinas = [M1|IdsMaquinas1].
	
createSeries(_, [], [], [], [], []).

%clcula o custo da totalidade das series vao ser exibidas
custoTotal([], _, 0).
custoTotal([[Horario, _, M1, Custo]|SeriesCusto], Acm, CustoToal) :-
	Acm1 is Acm + 1,
	custoTotal(SeriesCusto, Acm1, CustoToal1),
	%alterar para não por harcoded
	M1 #\= 3 #<=> B,
	votosNoHorario(Acm, M1, Horario, Votos), write(Votos),nl,
	CustoToal #= CustoToal1 + B * (Custo / (Votos + 1)).

%ir a base de dados buscar o numero de votos da serie Acm, no dia M1, na hora Horario, com uma quantidade de votos Votos
votosNoHorario(Acm, M1, Horario, Votos) :-
	findall(Horario, (voto(Acm, M1, Horario)), Lista),
	length(Lista, Votos).
