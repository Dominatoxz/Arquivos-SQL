INSERT INTO Alunos(matricula, nome, endereco, cidade) VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO 
PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 
'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 
'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 
'CENTRO', 'NATAL');

SELECT * FROM Alunos;

INSERT INTO Disciplinas(cod_disc, nome_disc, carga_hr) VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 
100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

SELECT * FROM Disciplinas;

INSERT INTO Professores(cod_prof, nome, endereco, cidade) VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO 
PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 
'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 
'NATAL');

SELECT * FROM Professores;

INSERT INTO Turma(disciplina, cod_turma, professor, ano, horario) VALUES
('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 3, 192011, 2015, '08H-09H'),
('WEB', 4, 192011, 2015, '07H-08H'),
('ENG', 5, 122135, 2015, '10H-11H');

SELECT * FROM Turma;

INSERT INTO Historico(matricula, disciplina, cod_turma, professor, ano, frequencia, nota) VALUES
/*BD*/
(2015010101,'BD', 1, 212131, 2015, '80%', 8),
(2015010102,'BD', 1, 212131, 2015, '90%', 9), 
(2015010103,'BD', 1, 212131, 2015, '70%', 3),
(2015010104,'BD', 2, 212131, 2015, '80%', 7),
(2015010105,'BD', 2, 212131, 2015, '50%', 4),
(2015010106,'BD', 2, 212131, 2015, '30%', 3),
/*POO*/
(2015010101,'POO', 3, 192011, 2015, '60%', 7),
(2015010102,'POO', 3, 192011, 2015, '40%', 5), 
(2015010103,'POO', 3, 192011, 2015, '80%', 7),
(2015010104,'POO', 3, 192011, 2015, '30%', 2),
(2015010105,'POO', 3, 192011, 2015, '40%', 6),
(2015010106,'POO', 3, 192011, 2015, '90%', 9),
/*WEB*/
(2015010101,'WEB', 4, 192011, 2015, '70%', 8),
(2015010102,'WEB', 4, 192011, 2015, '60%', 7), 
(2015010103,'WEB', 4, 192011, 2015, '40%', 4),
(2015010104,'WEB', 4, 192011, 2015, '50%', 6),
(2015010105,'WEB', 4, 192011, 2015, '90%', 9),
(2015010106,'WEB', 4, 192011, 2015, '80%', 8),
/*ENG*/
(2015010101,'ENG', 5, 122135, 2015, '60%', 7),
(2015010102,'ENG', 5, 122135, 2015, '50%', 4), 
(2015010103,'ENG', 5, 122135, 2015, '60%', 8),
(2015010104,'ENG', 5, 122135, 2015, '80%', 9),
(2015010105,'ENG', 5, 122135, 2015, '90%', 10),
(2015010106,'ENG', 5, 122135, 2015, '30%', 5);

SELECT * FROM Historico;

/*Exercicio (a)*/
SELECT DISTINCT matricula 
FROM Historico
WHERE disciplina = 'BD' AND ano = 2015 AND nota < 5;

/*Exercicio (b)*/
SELECT matricula, AVG(nota) AS media_nota
FROM Historico
WHERE disciplina = 'POO' AND ano = 2015
GROUP BY matricula;

/*Exercicio (c)*/
SELECT matricula, AVG(nota) AS media_nota
FROM Historico
WHERE disciplina = 'POO' AND ano = 2015
GROUP BY matricula
HAVING AVG(nota) > 6;

/*Lista de exercicio*/
/*Exercicio (1)*/
SELECT matricula
FROM Historico
WHERE disciplina = 'ENG' AND ano = 2015 AND nota > 7;

/*Exercicio (1)*/
SELECT nome, cidade AND cod_turma
FROM Professores, Turma
WHERE 







