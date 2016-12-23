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