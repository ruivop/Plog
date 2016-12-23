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
	 
	 
%passa por todas as séries
horarioSuposto(Series) :-
    horarioSuposto([], Series).

horarioSuposto(Acc, [task(Inicio, _, Fim,  _, IdDia)| Series]) :-
    serie(Id, _, _, _, ListaHorario),
    \+ member(Id, Acc), !,
    horarioSuposto([Id|Acc], Series),
	exactly(Inicio, ListaHorario, B), % o fim e o inicio tem de aparecer uma vez na lista de de Horarios obrigatorios
	exactly(Fim, ListaHorario, C),
	mudaMaquina(B, IdDia),
	mudaMaquina(C, IdDia).

horarioSuposto(_,_).


mudaMaquina(0, IdDia):- IdDia #= 3.
mudaMaquina(1, _).
	