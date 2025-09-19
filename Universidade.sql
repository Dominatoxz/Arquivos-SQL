CREATE DATABASE Universidade;
USE Universidade;

CREATE TABLE Alunos(
    matricula INT PRIMARY KEY,
    nome VARCHAR (50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL);
    
CREATE TABLE Disciplinas(
	cod_disc VARCHAR(50) PRIMARY KEY,
	nome_disc VARCHAR(50) NOT NULL,
	carga_hr INT);
    
CREATE TABLE Professores(
	cod_prof INT PRIMARY KEY,
	nome VARCHAR(50),
	endereco VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL);

CREATE TABLE Turma(
	disciplina VARCHAR(50) NOT NULL,
	cod_turma INT NOT NULL,
	professor INT NOT NULL,
	ano INT NOT NULL,
	horario VARCHAR(150) NOT NULL,
	PRIMARY KEY (disciplina, cod_turma, professor, ano),
	FOREIGN KEY (disciplina) REFERENCES Disciplinas(cod_disc),
	FOREIGN KEY (professor) REFERENCES Professores(cod_prof));

CREATE TABLE Historico(
	matricula INT NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    cod_turma INT NOT NULL,
    professor INT NOT NULL,
    ano INT,
    frequencia VARCHAR(250) NOT NULL,
    nota FLOAT NOT NULL,
    PRIMARY KEY (matricula, disciplina, cod_turma, professor, ano),
	FOREIGN KEY (matricula) REFERENCES Alunos(matricula),
    FOREIGN KEY (disciplina, cod_turma, professor, ano) REFERENCES Turma(disciplina, cod_turma, professor, ano)
);