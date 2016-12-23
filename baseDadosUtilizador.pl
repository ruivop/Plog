/*BASE DE DADOS A FAZER PELO UTILIZADOR*/

%dia para fazer a programacao 
dia(2).
dia(3).
dia(6).

%series disponiveis
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