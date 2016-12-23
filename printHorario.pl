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