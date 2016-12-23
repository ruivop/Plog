/*BASE DE DADOS A FAZER PELO UTILIZADOR*/

%dia para fazer a programacao 
dia(1).
dia(2).

inicio(16).
fim(23).

%series disponiveis
%indice, nome, custo, duração, horario obrigatório
serie(1, 'ER', 40000, 2, X):- horarioMatinal(X).
serie(2, 'Friends', 40000, 3, X):- horarioMatinal(X).
serie(3, 'Marco Polo', 50000, 4, X):- horarioNormal(X).
serie(4, 'Camelot', 20000, 1, X):- horarioNormal(X).
serie(5, 'Rome', 50000, 6, X):- horarioNoturno(X).
serie(6, 'Game of Thrones', 20000, 2, X):- horarioNormal(X).
serie(7, 'Frasier', 50000, 5, X):- horarioNormal(X).
serie(8, 'Deadwood', 50000, 6, X):- horarioNoturno(X).
serie(9, 'Lost', 50000, 3, X):- horarioNormal(X).
serie(10, 'Fringe', 50000, 1, X):- horarioNormal(X).
serie(11, 'House of Cards', 50000, 4, X):- horarioNormal(X).
serie(12, 'Breaking Bad', 50000, 6, X):- horarioNormal(X).
serie(13, 'Doctor Who', 50000, 2, X):- horarioNormal(X).

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