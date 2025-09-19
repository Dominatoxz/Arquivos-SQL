-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criar tabela autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

-- Criar tabela livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(id_autor)
);

-- Inserir dados na tabela autores
INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado');

-- Inserir dados na tabela livros
INSERT INTO livros (titulo, autor_id) VALUES
('Dom Casmurro', 1),
('A Hora da Estrela', 2),
('Gabriela, Cravo e Canela', 3),
('Memórias Póstumas de Brás Cubas', 1);

INSERT INTO livros (titulo, autor_id) VALUES
('Divergente', NULL);

/*Exiba os livros com nomes dos autores correspondentes*/
SELECT livros.titulo, autores.nome_autor 
FROM livros 
INNER JOIN autores ON livros.autor_id = autores.id_autor;

/*Exiba todos os livros, mostrando o autor quando houver, ou NULL quando não houver*/
SELECT livros.titulo, autores.nome_autor 
FROM livros
LEFT JOIN autores ON livros.autor_id = autores.id_autor; 

/*LEFT JOIN: retorna todas as linhas da tabela à esquerda e as correpondências da tabela
da direita. Quanto não tem correspondência, mostra NULL */

/*RIGHT JOIN: retorna todas as linhas da tablea à direita correpondências da tabela
da esquerda. Quanto não tem correspondência, mostra NULL */

/*Exiba todos os autores, com seus livros correspondentes ou NULL caso não tenha livros cadastrados*/
INSERT INTO autores(nome_autor) VALUES
('Luiza Sonza ');

INSERT INTO autores(nome_autor) VALUES
('Billie Eilish');

SELECT autores.nome_autor, livros.titulo
FROM autores
LEFT JOIN livros ON livros.autor_id = autores.id_autor;

/*Liste todos os livros com seus autores em ordem alfabetica pelo titulo do livro*/
SELECT livros.titulo, autores.nome_autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id_autor
ORDER BY livros.titulo ASC;

/*Liste todos os autores e a quantidade de livros que cada um possui */
SELECT autores.nome_autor, COUNT(livros.autor_id) AS total_livros
FROM autores
INNER JOIN livros ON livros.autor_id = autores.id_autor
GROUP BY autores.id_autor;

/*Liste todos os autores que não possuem nenhum livro cadastrado*/
SELECT autores.nome_autor
FROM autores
LEFT JOIN livros ON livros.autor_id = autores.id_autor
GROUP BY autores.id_autor
HAVING COUNT(livros.autor_id) = 0;






