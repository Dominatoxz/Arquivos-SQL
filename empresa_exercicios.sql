/*COUNT, SU, AVG, MIN e MAX*/
/*COUNT: CONTA QUANTAS EXISTEM*/
SELECT COUNT(*) AS total_cliente FROM cliente;

/*AVG: AVERAGE- Média*/
SELECT AVG(Valor) AS media_valor_carros FROM carro;

/*MIN: Mínimo*/
/*Menor valor de aluguel de carro disponível*/
SELECT MIN(valor) AS menor_valor_carro FROM carro;

/*MAX: Máximo*/
/*Maior valor de aluguel de carro disponível*/
SELECT MAX(valor) AS menor_valor_carro FROM carro;

/*SUM: Soma*/
SELECT SUM(valor) AS soma_valor_carro FROM carro;

/*WHERE X HAVING*/
/*WHERE: filtrar linhas individuais antes da agregação
HAVING: filtra grupos após a agregação*/
/*agregação: uso de funções para calculos em um conjunto
de valores de uma coluna, retornando o unico valor resumido.*/

/*NOME_TABELA AS APELIDO_TABELA*/
/*Mostrar clientes que fizeram mais de 2 alugueis*/
SELECT Cliente.nome , COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codaluguel) > 2;

/*JOIN: junta as tabelas
GROUP BY: agrupa os resultados por uma ou mais tabelas*/

/*Mostrar marcas que possuem mais de 1 carro cadastrado*/

SELECT marca.marca, COUNT(carro.codcarro) AS total_carros
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca
HAVING COUNT(carro.codcarro);

/*Exercicio 1*/
SELECT COUNT(*) AS todos_clientes FROM cliente;

/*Exercicio 2*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
LEFT JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome;

/*Exercicio 3*/
SELECT cliente.nome, SUM(carro.valor) AS total_gasto
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
JOIN carro ON aluguel.codcarro = carro.codcarro
GROUP BY cliente.nome;

/*Exercicio 4*/
SELECT AVG(valor) AS media_precos FROM carro; 

/*Exercicio 5*/
SELECT MIN(VALOR) AS minimo, MAX(VALOR) AS maximo FROM carro;

/*Exercicio 6*/
SELECT marca.marca, COUNT(carro.codcarro) AS total_carros
FROM marca 
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca 
HAVING COUNT(carro.codcarro) > 1;

/*Exercicio 7*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS numero_alugueis
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codaluguel) > 2;

/*Exercicio 8*/
SELECT marca.codmarca, marca.marca AS marca, carro.modelo AS carro
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.codmarca
HAVING COUNT(carro.valor);






