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


diaSemana(1, 'Segunda Feira').
diaSemana(2, 'Terca Feira').
diaSemana(3, 'Quarta Feira').
diaSemana(4, 'Quinta Feira').
diaSemana(5,'Sexta Feira').
diaSemana(6, 'Sabado').
diaSemana(7, 'Domingo').

%indice, nome, custo, duração, horario obrigatório
serie(1, 'batman1', 50000, 2, X):- horarioNoturno(X).
serie(2, 'batman2', 50000, 3, X):- horarioNoturno(X).
serie(3, 'batman3', 50000, 2, X):- horarioNoturno(X).
serie(4, 'batman4', 50000, 1, X):- horarioNoturno(X).
serie(5, 'batman5', 50000, 1, X):- horarioNoturno(X).
serie(6, 'batman6', 50000, 2, X):- horarioNoturno(X).
serie(7, 'batman7', 50000, 5, X):- horarioNoturno(X).
serie(8, 'batman8', 50000, 2, X):- horarioNoturno(X).
serie(9, 'batman9', 50000, 3, X):- horarioNoturno(X).
serie(10, 'batman10', 50000, 1, X):- horarioNoturno(X).
/*serie(11, 'batman11', 50000, 1, X):- horarioNoturno(X).
serie(12, 'batman12', 50000, 1, X):- horarioNoturno(X).
serie(13, 'batman13', 50000, 2, X):- horarioNoturno(X).
serie(14, 'batman14', 50000, 3, X):- horarioNoturno(X).
serie(15, 'batman15', 50000, 1, X):- horarioNoturno(X).
serie(16, 'batman16', 50000, 2, X):- horarioNoturno(X).
serie(17, 'batman17', 50000, 1, X):- horarioNoturno(X).
serie(18, 'batman18', 50000, 4, X):- horarioNoturno(X).
serie(19, 'batman19', 50000, 3, X):- horarioNoturno(X).
*/

% -X: lista dos horarios da noite
horarioNoturno([1, 2, 3, 4, 5, 6, 7, 8, 9, 48, 49]).

/*
fazerHorario:-
	declararHorario(L, 1, 10),
	domainHorario(L),
%declara um lista L, como uma lista de listas com em que o primeiro elemento é o indice do horário e o segundo é o indice da série
%HorMin: indice do horario minimo; HorMax: indice do horario maximo; 
declararHorario([], HorMax, HorMax).
declararHorario([Hora|L], HorMin, HorMax):-
	length(Hora, 2), %primeiro: indice do horário; segundo: indice da série
	HorMin1 is HorMin + 1,
	declararHorario(L, HorMin1, HorMax).
	
%poe os dominios nas horas e nas séries
domainHorario([]).
domainHorario([[H,S]|Rest]):-
	H in 0 .. 24, %numero das horas 
	S in 0 .. 19, %numero das series
	domainHorario(Rest).
*/

projeto(Ss, Es, Ms) :-
	createSeries(Series, Ss, Es, Ms),
	
	domain(Ss, 44, 48), %tempos iniciais
    domain(Es, 45, 49), %tempos finais
    domain(Ms, 1, 3), %id das maquinas
	
    %All machines has resource capacity = 1
    Dias = [
        machine(1, 1),
		machine(2, 1),
        machine(3, 100) %só para caberem todos os outros que não foram para o ar
    ],
	
	diasSemVazios(Dias, Series, 5),
	
    cumulatives(Series, Dias, [bound(upper)]),
    maximum( MaxEndTime, Es ),
    append([Ms, Ss ], Vars),

    labeling( [minimize(MaxEndTime)], Vars),
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
createSeries(Sries, TempoIni, TempoFinal, IdsMaquinas) :-
    createSeries([], Sries, TempoIni, TempoFinal, IdsMaquinas).

createSeries(Acc, Sries, TempoIni, TempoFinal, IdsMaquinas) :-
    serie(Id, _, _, Duracao, _),
    \+ member(Id, Acc), !,
    createSeries([Id|Acc], Sries1, TempoIni1, TempoFinal1, IdsMaquinas1),
	
	Sries = [ task(S1, Duracao,  E1,  1, M1) | Sries1],
	TempoIni = [S1 | TempoIni1],
	TempoFinal = [E1|TempoFinal1],
	IdsMaquinas = [M1|IdsMaquinas1].
	
createSeries(_, [], [], [], []).
