
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


