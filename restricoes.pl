%restricoes

diasSemVazios([machine(_,_)],_,_).
diasSemVazios([machine(IdDia, _)|Dias], Series, TamDias):-
	contarTamDia(IdDia, Series, TamDia),
	TamDia #= TamDias,
	diasSemVazios(Dias, Series, TamDias).
	
contarTamDia(_, [], 0).
contarTamDia(Dia, [task(_, Duracao, _,  _, DiaX)| Series], TamDia):-
	 Dia #= DiaX #<=> Count,
	 contarTamDia(Dia, Series, TamDia1),
	 TamDia #= TamDia1 + Count * Duracao.
	 

%copiado do manual sicstus pag 424
%exactly(X, L, N) , defied to be true if X occurs exactly N times in the list L
exactly(_, [], 0).
exactly(X, [Y|L], N) :-
	X #= Y #<=> B,
	N #= M+B,
	exactly(X, L, M).
	 
	 
%passa por todas as séries ve se leas estao no horario suposto (noturno, matinal ou normal)
horarioSuposto(Series) :-
    horarioSuposto([], Series).

horarioSuposto(Acc, [task(Inicio, _, Fim,  _, IdDia)| Series]) :-
    serie(Id, _, _, _, ListaHorario),
    \+ member(Id, Acc), !,
    horarioSuposto([Id|Acc], Series),
	exactly(Inicio, ListaHorario, B), % o fim e o inicio tem de aparecer uma vez na lista de de Horarios obrigatorios
	exactly(Fim, ListaHorario, C),
	diaFinal(X),
	(B #= 0 #/\ IdDia #= X) #\/ B #\= 0,
	(C #= 0 #/\ IdDia #= X) #\/ C #\= 0.

horarioSuposto(_,_).


%trata dos casos de contratos em que duas series nao podem ser transmitidas no mesmo dia
restricaoContratual(Series) :-
	restricaoContratual([], Series).
	
restricaoContratual(Acc,  Series) :-
    contrato(Id1, Id2),
    \+ member([Id1, Id2], Acc), !,
    restricaoContratual([[Id1, Id2]|Acc], Series),
	nth1(Id1, Series, task(_, _, _,  _, IdDia1)),
	nth1(Id2, Series, task(_, _, _,  _, IdDia2)),
	diaFinal(X),
	IdDia1 #\= IdDia2 #\/ (IdDia1 #= X #/\ IdDia2 #= X).
restricaoContratual(_, _).
