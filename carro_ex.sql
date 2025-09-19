CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE tabela_carro(
	placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(10) NOT NULL,
    modelo VARCHAR(10) NOT NULL,
    anofab INT NOT NULL);

INSERT INTO tabela_carro(placa, marca, modelo, anofab)
VALUES
	('ABC1234', 'Toyota', 'Corolla', 2015),
    ('DEF5678', 'Honda', 'Civic', 2018),
    ('GHI9012', 'Ford', 'Focus', 2013),
    ('JKL3456', 'Chevrolet', 'Onix', 2020),
    ('MNO7890', 'Hyundai', 'HB20', 2019);
    
SELECT * FROM tabela_carro;

UPDATE tabela_carro SET modelo = 'GOl' WHERE placa = 'MNO7890';

DELETE FROM tabela_carro WHERE placa = 'MNO7890';

CREATE VIEW carros_2000 AS
SELECT placa, marca, modelo, anofab
FROM tabela_carro WHERE anofab >= 2000;

SELECT * FROM carros_2000;

ALTER TABLE tabela_carro
ADD COLUMN tabela_fipe FLOAT(20) AFTER anofab;
SELECT * FROM tabela_carro;

UPDATE tabela_carro
SET tabela_fipe = CASE
	WHEN placa = 'ABC1234' THEN 110000
	WHEN placa = 'DEF5678' THEN 90000
    WHEN placa = 'GHI9012' THEN 60000
    WHEN placa = 'JKL3456' THEN 100000
    WHEN placa = 'MNO7890' THEN 80000
END;

SET SQL_SAFE_UPDATES = 0;


    

    
