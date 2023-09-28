
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

