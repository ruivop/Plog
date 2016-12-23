:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('restricoes.pl').
:- include('baseDadosFixa.pl').
:- include('baseDadosUtilizador.pl').
:-include('printHorario.pl').
				  

projeto:-
	statistics(walltime, [Start,_]),
	createSeries(Series, SriesCusto, Ss, Es, Ms),
	createDias(Dias), %cada dia é uma maquina á exeção da ultima maquina que nao tem dia
	
	inicio(TempoInicio),
	fim(TempoFim),
	TempoFimTotal is  TempoFim - 1,
	TempoInicioTotal is TempoInicio + 1,
	Diff is TempoFim - TempoInicio,
	domain(Ss, TempoInicio, TempoFimTotal), %tempos iniciais
    domain(Es, TempoInicioTotal, TempoFim), %tempos finais
	diaFinal(X),
    domain(Ms, 1, X), %id dos dias
	CustoTotal in 0 .. 9999999,
	
	%restricoes
	diasSemVazios(Dias, Series, Diff),
	horarioSuposto(Series),
	restricaoContratual(Series),
	
	custoTotal(SriesCusto, 1, CustoTotal),
    cumulatives(Series, Dias, [bound(upper)]),
    append([Ms, Ss, [CustoTotal] ], Vars),

    labeling([min, minimize(CustoTotal)], Vars),
	statistics(walltime, [End,_]),
	Time is End - Start,
	format('Demorou ~3d segundos.~n', [Time]),
	printSeriesDias(Series, Dias).
	
	
	
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

%passa por todas os dias da semana na base de dados e forma estroturas de dados correspondentes
createDias(Dias) :-
    createDias([], 1, Dias).

createDias(Acc, _, Dias) :-
    dia(Id),
    \+ member(Id, Acc), !,
	Acm1 is Id + 1,
    createDias([Id|Acc], Acm1, Dias1),
	Dias = [machine(Id, 1) | Dias1].
	
createDias(_, Acm, [machine(Acm, 9999)]):- assertz(diaFinal(Acm)).

%clcula o custo da totalidade das series vao ser exibidas
custoTotal([], _, 0).
custoTotal([[Horario, _, M1, Custo]|SeriesCusto], Acm, CustoToal) :-
	Acm1 is Acm + 1,
	custoTotal(SeriesCusto, Acm1, CustoToal1),
	diaFinal(X),
	M1 #\= X #<=> B,
	votosNoHorario(Acm, M1, Horario, Votos),
	CustoToal #= CustoToal1 + B * (Custo / (Votos + 1)).

%ir a base de dados buscar o numero de votos da serie Acm, no dia M1, na hora Horario, com uma quantidade de votos Votos
votosNoHorario(Acm, M1, Horario, Votos) :-
	findall(Horario, (voto(Acm, M1, Horario)), Lista),
	length(Lista, Votos).
