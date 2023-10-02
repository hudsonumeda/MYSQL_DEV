
--> SERVIDOR PODE TER VÁRIOS BANCO DE DADOS

--CRIANDO O BANCO DE DADOS(db_devmedia), USANDO E CRIANDO UMA TABELA(t_clientes):
CREATE DATABASE db_devmedia;

USE db_devmedia;

CREATE TABLE t_clientes
(
    codigo  INT,
    nome    VARCHAR(100)

);

--ALTER TABLE -  ADD ADICIONANDO UMA NOVA COLUNA (email):
ALTER TABLE t_clientes ADD email VARCHAR(50);

--ALTER TABLE -  DROP REMOVENDO A COLUNA (email):
ALTER TABLE t_clientes DROP COLUMN email;

--ALTER TABLE -  MODIFY ALTERANDO O TAMANHO DO CAMPO (nome):
ALTER TABLE t_clientes MODIFY nome VARCHAR(200);

-- DROP NA TABELA(db_devmedia):
DROP TABLE db_devmedia;

--------------------------------------------------------------------

--> INSERIR DADOS NA TABELA (INSERIR LINHAS)

CREATE TABLE t_produtos 
(
    codigo    INT,
    nome      VARCHAR(100),
    preco     DECIMAL(10,0)
)

INSERT INTO t_produtos (codigo, nome, preco) VALUES (1, 'Café',3.90),
INSERT INTO t_produtos (codigo, nome, preco) VALUES (2, 'Nescau',4.50),

-------------------------------------------------------------------------------

--> ATUALIZAR DADOS 

UPDATE t_produtos SET nome = 'Água Mineral' WHERE codigo = 8;

PDATE t_produtos SET nome = 'Filé de Frango', preco = 9.25 WHERE codigo = 7;  --> ALTERANDO NOME E PREÇO, DO PRODUTO COM CODIGO 7

-- UPDATE COM 'IN', PARA PEGAR VÁRIOS CÓDIGOS:
UPDATE t_produtos SET preco = preco + 1 WHERE codigo IN (6, 7, 8);

----------------------------------------------------------------------------------------

--> REMOVER LINHAS - DROP: TABELAS E BANCOS, DELETE: LINHAS

DELETE FROM t_produtos WHERE codigo = 5;

DELETE FROM t_produtos WHERE codigo IN (6, 7, 8);

DELETE FROM t_produtos WHERE preco IS NULL;

-------------------------------------------------------------------------------------

--> CONSULTAS SIMPLES

SELECT nome, preco
FROM   t_produtos
WHERE  codigo = 15

SELECT nome, preco
FROM   t_produtos
WHERE  codigo 
IN     (18,19);

SELECT nome, preco
FROM   t_produtos
WHERE  codigo 
NOT IN (20,21);

SELECT codigo, nome, preco
FROM   t_produtos
WHERE  preco 
BETWEEN 3.2 AND 6.1

SELECT codigo, nome, preco
FROM   t_produtos
WHERE  nome 
LIKE   'Ba%'

-----------------------------------------------------------------------------

-->CAMPOS CALCULADOS

SELECT codigo,
       nome,
       preco, 
       preco + 1  AS preco_novo
FROM   t_produtos;

---------------------------------------------------------------------

-->ORDENAÇÃO

SELECT  codigo,
        nome,
        preco
FROM    t_produtos
ORDER BY preco ASC;     --> DESC ou ASC

SELECT  codigo,
        nome,
        preco
FROM    t_produtos
ORDER BY preco DESC, nome ASC;  

----------------------------------------------------------------------------

--> FUNÇÕES DE AGREGAÇÃO

--SOMA
SELECT SUM(quantidade)  AS quantidade_vendas
FROM   vendas
WHERE  codigo = '100';

-->MÉDIA
SELECT AVG(quantidade)  AS media_vendas
FROM   vendas
WHERE  codigo = '100';

-->MAX
SELECT MAX(quantidade)  AS max_vendas  -->MAIOR VALOR DA COLUNA
FROM   vendas
WHERE  codigo = '100';

-->MIN
SELECT MAX(quantidade)  AS min_vendas  --> MENOS VALOR DA COLUNA
WHERE  codigo = '100';

-->COUNT
SELECT COUNT(*)  AS min_vendas
FROM   vendas
WHERE  codigo = '100';

----------------------------------------------------------------

-->AGRUPAMENTO DE DAOS

SELECT   data_venda,
         SUM(quantidade)
FROM     t_vendas
WHERE    id_produto = '199'
GROUP BY data_venda
HAVING   SUM(quantidade) > 2;   -->APLICA FILTRO SOBRE AGRUPAMENTOS!

SELECT   vendedor,
         SUM(valor)
FROM     t_vendas
GROUP BY vendedor
HAVING   SUM(valor) > 5000,

SELECT   estado,
         SUM(valor_venda) 
FROM     regiao = 'Sudeste'
GROUP BY estado
HAVING   SUM(valor_venda) > 4000;

--WHERE: APLICA FILTRO EM LINHAS INDIVIDUAIS, AGE COMO PRÉ-FILTRO, PODE USA NO SELECT, UPDATE E DELETE
--HAVING: APLICA FILTROS EM GRUPOS, AGE COMO PÓS-FILTRO, SOMENTE ULTILIZADO COM SELECT 

-------------------------------------------------------------------------------

--> JUNTAR TABELAS - JOIN

SELECT     clientes.codigo,
           clientes.nome,
           clientes.codigo_vendedor,
           vendedores.nome
FROM       t_clientes
RIGHT JOIN vendedores 
ON         clientes.codigo_vendedor = vendedores.codigo;

--> UNION

SELECT   descricao,
         valor,
         vencimento,
         'receber'        AS tipo
FROM     t_contas_receber
UNION                         --> SUPRIME RECURSOS IGUAIS! REOMVE AS DUPLICADAS
SELECT   descricao,
         valor,
         vencimento,
         'pagar'          AS tipo
FROM     t_contas_pagar
ORDER BY vencimento;


SELECT   descricao,
         valor,
         vencimento,
         'receber'        AS tipo
FROM     t_contas_receber
UNION                         --> NÃO SUPRIME NADA!
SELECT   descricao,
         valor,
         vencimento,
         'pagar'          AS tipo
FROM     t_contas_pagar
ORDER BY vencimento;