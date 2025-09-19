CREATE DATABASE CadastroCliente;
USE CadastroCliente;

CREATE TABLE Cliente(
cod_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(50) NOT NULL,
genero_cliente CHAR(01) NOT NULL CHECK(genero_cliente IN('F', 'M', 'O')) DEFAULT 'F',
renda_cliente DECIMAL(10,2) CHECK(renda_cliente >= 0) DEFAULT 0,
rg_cliente CHAR(12) NOT NULL UNIQUE,
data_cadastro_cliente DATE NOT NULL
);

CREATE TABLE Funcionario(
cod_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_funcionario VARCHAR(50) NOT NULL,
genero_funcionario CHAR(01) NOT NULL CHECK(genero_funcionario IN('F', 'M', 'O')) DEFAULT 'F',
salario_funcionario DECIMAL(10,2) NOT NULL CHECK(salario_funcionario >= 0) DEFAULT 0,
rg_funcionario CHAR(12) NOT NULL UNIQUE,
data_cadastro_funcionario DATE NOT NULL
); 

INSERT INTO Cliente(nome_cliente, genero_cliente, renda_cliente, rg_cliente, data_cadastro_cliente) VALUES 
('Jõao Carlos', 'M', 5000.00, '123456','1996-07-28'),
('Daniel', 'M', 6000.00, '145678','2000-04-23'),
('Helena', 'F', 6000.00, '564333','2002-05-30'),
('Roberta', 'F', 5000.00, '564322','1994-03-12'),
('Renata', 'F', 3000.00, '654321','1993-08-27'),
('Giovanna', 'F', 3500.00, '564321','1990-06-12');

INSERT INTO Funcionario(nome_funcionario, genero_funcionario, salario_funcionario, rg_funcionario, data_cadastro_funcionario) VALUES
('Salvador', 'M', 7000.00, '098765', '1995-01-03'),
('Antônio', 'M', 6000.00, '987654','1998-06-08'),
('Antonieta', 'F', 6500.00, '876543','1998-08-07'),
('Eduardo', 'M', 4000.00, '765432','2000-08-08'),
('Leny', 'F', 3000.00, '654321','2001-08-06');

SELECT 
	'Cliente' AS Tipo,
    nome_cliente AS Nome, 
    genero_cliente AS Genero,
    DATE_FORMAT(data_cadastro_cliente, '%d/%m/%Y') AS Data_cadastro,
    rg_cliente AS RG
FROM Cliente

UNION ALL

SELECT 	
	'Funcionario' AS Tipo,
    nome_funcionario AS Nome,
    genero_funcionario AS Genero,
    DATE_FORMAT(data_cadastro_funcionario, '%d/%m/%Y') AS Data_cadastro,
    rg_funcionario AS RG
FROM Funcionario;
