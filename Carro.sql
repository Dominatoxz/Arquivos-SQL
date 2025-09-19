CREATE DATABASE Carro;

CREATE TABLE tbl_carro(
    placa VARCHAR(7) PRIMARY KEY NOT NULL,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    anofab INT(20) NOT NULL
);

INSERT INTO tbl_carro(placa, marca, modelo, anofab)
VALUES 
	('ABC1234','Volkswagem', 'Gol', 2007),
    ('DEF5678', 'Honda','City', 2024),
    ('GHI1234', 'Toyota', 'Corolla', 2023),
	('JKL9012', 'Ford', 'Focus', 2022),
	('MNO3456', 'Chevrolet', 'Cruze', 2024);
    
SELECT * FROM tbl_carro;


/*UPDATE: atualizar algum campo*/
UPDATE tbl_carro SET modelo = 'Civic' WHERE placa = 'DEF5678';
SELECT * FROM tbl_carro;

UPDATE tbl_carro SET anofab = 1998 WHERE placa = 'DEF5678';

/*Create viw: tabela virtual*/
CREATE VIEW View_Carros_dois AS
SELECT marca, modelo, anofab
FROM tbl_carro WHERE anofab >= 2000;

SELECT * FROM View_Carros_dois;
SELECT * FROM tbl_carro;
    
/*ADD COLUMN*/
ALTER TABLE tbl_carro
ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo;
SELECT * FROM tbl_carro;

UPDATE tbl_carro SET tabela_fipe = 120000 WHERE placa = 'DEF5678';
SELECT * FROM tbl_carro;

/*Mais de uma linha*/
UPDATE tbl_carro
SET tabela_fipe = CASE
	WHEN placa = 'GHI1234' THEN 130000
    WHEN placa = 'JKL9012' THEN 60000
    WHEN placa = 'MNO3456' THEN 110000
    WHEN placa = 'ABC1234' THEN 16000
END;
    
SET SQL_SAFE_UPDATES = 0;