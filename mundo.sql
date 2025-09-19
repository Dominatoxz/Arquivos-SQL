CREATE DATABASE Mundo;
USE Mundo;

CREATE TABLE Pais(
id_pais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(35) NOT NULL,
continente VARCHAR(35) NOT NULL,
pop REAL,
pib REAL,
expec_vida REAL
);

CREATE TABLE Cidade(
id_cidade INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(35) NOT NULL,
pais INT NOT NULL,
pop REAL,
capital VARCHAR(1) NOT NULL,
FOREIGN KEY (pais) REFERENCES Pais(id_pais)
);

CREATE TABLE Rio(
id_rio INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(35) NOT NULL,
nascente INT NOT NULL,
pais INT NOT NULL,
comprimento INTEGER,
FOREIGN KEY (nascente) REFERENCES Pais(id_pais),
FOREIGN KEY (pais) REFERENCES Pais(id_pais)
);

INSERT INTO Pais(nome, continente, pop, pib, expec_vida) VALUES
('Canada', 'Am. Norte', 30.1, 658, 77.08),
('Mexico', 'Am. Norte', 107.5, 694, 69.01), 
('Brasil', 'Am. Sul', 183.3, 1004, 65.2), 
('USA', 'Am. Norte', 270.0, 8003, 75.5); 

INSERT INTO Cidade(nome, pais, pop, capital) VALUES
('Washington', 4, 3.3, 'S'),
('Monterrey', 2, 2.0, 'N'),
('Brasilia', 3, 1.5, 'S'),
('São Paulo', 3, 15.0, 'N'),
('Ottawa', 1, 0.8, 'S'),
('Cid.Mexico', 2, 14.1, 'S');

INSERT INTO Rio(nome, nascente, pais, comprimento) VALUES
('St.Lawrence', '4', 4, 3.3),
('Grande', '4', 2, 2.0),
('Parana', '3', 3, 1.5),
('Mississipi', '4', 4, 15.0);

/*Lista de Exercicios*/
/*Exercicio 1*/
SELECT cidade.nome AS cidade, pais.nome AS pais
FROM cidade
JOIN pais ON cidade.pais = pais.id_pais;

/*Exercicio 2*/
SELECT cidade.nome AS capitais FROM cidade 
WHERE capital = 'S';

/*Exercicio 3*/
SELECT * FROM pais WHERE expec_vida < 70;

/*Exercicio 4*/
SELECT cidade.nome, pais.nome, pais.pop 
FROM pais
LEFT JOIN cidade ON cidade.pais = pais.id_pais
WHERE cidade.capital = 'S' AND pais.pib > 1000;

/*Exercicio 5*/
SELECT cidade.nome, cidade.pop
FROM cidade
JOIN pais ON cidade.pais = pais.id_pais
LEFT JOIN rio ON rio.nascente = pais.id_pais
WHERE cidade.capital = 'S';

/*Exercicio 6*/
SELECT AVG(cidade.pop) FROM cidade WHERE cidade.capital = 'N';

/*Exercicio 7*/
SELECT pais.continente, AVG(pais.pib) FROM pais
GROUP BY pais.continente;

/*Exercicio 8*/
SELECT rio.nome, rio.comprimento 
FROM rio 
LEFT JOIN pais ON rio.nascente = pais.id_pais
WHERE rio.nascente 


