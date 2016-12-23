%tempos slot(Id, tempo de inicio).
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

%dias da semana (Id, Legenda)
diaSemana(1, 'Segunda Feira').
diaSemana(2, 'Terca Feira').
diaSemana(3, 'Quarta Feira').
diaSemana(4, 'Quinta Feira').
diaSemana(5,'Sexta Feira').
diaSemana(6, 'Sabado').
diaSemana(7, 'Domingo').

% -X: lista dos horarios da noite
horarioMatinal([16, 17, 18, 19, 20, 21, 22, 23, 24]).
horarioNoturno([1, 2, 3, 4, 5, 6, 7, 8, 9, 48, 49, 50]).
horarioNormal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
				  11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
				  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
				  31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
				  41, 42, 43, 44, 45, 46, 47, 48, 49, 50]).

%dia final que para o qual vao as series nao passadas na tv 				  
:- dynamic diaFinal/1.