CREATE TABLE tbvdd (
   cdvdd        smallint not null,
   nmvdd        varchar(20),
   sxvdd        smallint, -- 1 - M | 0 - F
   perccomissao decimal(19,2),
   matfunc      smallint not null
); -- DROP TABLE tbvdd;

-- Criando as chaves primárias (DDL) - OK
ALTER TABLE tbvdd ADD PRIMARY KEY (cdvdd);

-- Inserindo tbvdd (DML)
INSERT INTO tbvdd VALUES (1 , 'Vendedor 1'    , 1, 1  , 1 );
INSERT INTO tbvdd VALUES (2 , 'Vendedor 2    ', 1, 1  , 2 );
INSERT INTO tbvdd VALUES (3 , ' Vendedor 3'   , 1, 1  , 3 );
INSERT INTO tbvdd VALUES (4 , 'Vendedor 4    ', 1, 0.5, 4 );
INSERT INTO tbvdd VALUES (5 , ' Vendedor 5'   , 0, 0.5, 5 );
INSERT INTO tbvdd VALUES (6 , 'Vendedor 6'    , 1, 0.5, 6 );
INSERT INTO tbvdd VALUES (7 , 'Vendedor 7'    , 0, 0.5, 7 );
INSERT INTO tbvdd VALUES (8 , 'Vendedor 8'    , 1, 0.5, 8 );
INSERT INTO tbvdd VALUES (9 , 'Vendedor 9'    , 0, 0.5, 9 );
INSERT INTO tbvdd VALUES (10, 'Vendedor 10'   , 1, 0.5, 10);

-- new insert
INSERT INTO tbvdd VALUES (11, null, 0, 0.5, 11);

-- Consultando dados (DQL)
SELECT * FROM tbvdd;

-- Criação da Tabela Dependente (DDL)
CREATE TABLE tbdep (
   cddep      INT GENERATED ALWAYS AS IDENTITY primary key, -- GENERATED ALWAYS AS IDENTITY (autoincremento do cddep)
   nmdep      varchar(20),
   dtnasc     date,
   sxdep      varchar(2),
   cdvdd      smallint,
   inepescola varchar(10),
   CONSTRAINT FK_Dep_Vdd FOREIGN KEY (cdvdd) REFERENCES tbvdd (cdvdd)
); -- DROP TABLE tbdep

-- Populando tbdep (DML)
INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 1' , '20100202', 'M' , 1, '11001887');

INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 2' , '20120405', 'M' , 3, '11001364'),
              ('Dependente 3' , '20130304', ' F', 3, '11001364'),
              ('Dependente 4' , '20100505', 'F' , 2, '11001666');

-- new insert
INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 4' , '20100505', 'F' , 2, '11001666');
	   
-- Consultando (DQL)
SELECT * FROM tbdep;


CREATE TABLE tbpro(
    cdpro smallint primary key,
    nmpro varchar(50) NULL,
    tppro varchar(1) NULL,
    undpro varchar(2) NULL,
    slpro int NULL,
    stpro varchar(50) NULL
);

INSERT INTO tbpro VALUES (1, 'Produto A'  , 'A', 'KG' , 20000, 'Ativo');
INSERT INTO tbpro VALUES (2, 'Produto C'  , 'A', 'KG' , 5000 , 'Ativo');
INSERT INTO tbpro VALUES (3, 'Produto E'  , 'B', 'KG' , 2000 , 'Ativo');
INSERT INTO tbpro VALUES (5, 'Produto CH' , 'A', 'KG' , 2000 , 'Ativo');
INSERT INTO tbpro VALUES (6, 'Produto AB' , 'A', 'KG' , 100  , 'Inativo');

-- new insert
INSERT INTO tbpro VALUES (7, 'Produto EH' , 'A', 'KG' , 2000 , 'Ativo');
INSERT INTO tbpro VALUES (8, 'Produto FA' , 'C', 'KG' , 1000 , 'Ativo');
INSERT INTO tbpro VALUES (9, 'Produto TO' , null, 'KG' , null , 'Ativo');

SELECT * FROM tbpro;

CREATE TABLE tbven(
    cdven   smallint primary key,
    dtven   date NULL,
    cdcli   smallint NULL,
    nmcli   varchar(50) NULL,
    agecli  smallint NULL,
    clacli  smallint NULL,
    sxcli   varchar(1) NULL,
    cidcli  varchar(50) NULL,
    estcli  varchar(50) NULL,
    paicli  varchar(50) NULL,
    canal   varchar(12) NOT NULL,
    stven   smallint NULL, -- 1 concluída, 2 em aberto e 3 é cancelada
    deleted smallint NULL,
    cdvdd   smallint NULL
); -- drop table tbven

ALTER TABLE tbven ADD CONSTRAINT "fk_vendas_vendedor" FOREIGN KEY ( cdvdd ) REFERENCES tbvdd ( cdvdd );

INSERT INTO tbven VALUES (1, '2010-02-01', 1, 'Cliente AA' , 30, 3, 'M', 'Florianópolis', 'Santa Catarina'   , 'Brasil', 'Loja Própria', 1,0,1);
INSERT INTO tbven VALUES (2, '2022-07-08', 2, 'Cliente GRM', 57, 1, 'M', 'Gramado'      , 'Rio Grande do Sul', 'Brasil', 'Loja Virtual', 1,0,2);
INSERT INTO tbven VALUES (3, '2022-07-08', 3, 'Cliente ARM', 50, 1, 'F', 'Fortaleza'    , 'Ceará'            , 'Brasil', 'Loja Virtual', 1,0,4);

INSERT INTO tbven VALUES (5, '2019-07-08', 5, 'Cliente CRM', 22, 1, 'F', 'São Paulo'      , 'São Paulo'      , 'Brasil', 'Loja Virtual', 1,0,3);
INSERT INTO tbven VALUES (6, '2018-04-08', 6, 'Cliente ACM', 30, 4, 'F', 'São Paulo'      , 'São Paulo'      , 'Brasil', 'Loja Virtual', 1,0,4);
INSERT INTO tbven VALUES (7, '2020-05-08', 7, 'Cliente ABM', 41, 2, 'F', 'Rio de Janeiro' , 'Rio de Janeiro' , 'Brasil', 'Loja Virtual', 1,0,3);
INSERT INTO tbven VALUES (8, '2011-06-08', 8, 'Cliente AAM', 19, 1, 'F', 'Eusébio'        , 'Ceará'          , 'Brasil', 'Loja Própria', 3,0,8);
INSERT INTO tbven VALUES (9, '2012-07-04', 9, 'Cliente AAA', 28, 5, 'F', 'Salvador'       , 'Bahia'          , 'Brasil', 'Loja Virtual', 2,0,5);
INSERT INTO tbven VALUES (10,'2013-03-03', 9, 'Cliente AAA', 28, 5, 'F', 'Salvador'       , 'Bahia'          , 'Brasil', 'Loja Virtual', 1,0,6);
INSERT INTO tbven VALUES (11, '2016-07-01', 10, 'Cliente AAAD', 28, 2, 'F', 'Vitória'       , 'Espirito Santo'      , 'Brasil', 'Loja Virtual', 2,0,5);
INSERT INTO tbven VALUES (12, '2016-05-03', 11, 'Cliente AAAE', 29, 3, 'F', 'Natal'         , 'Rio Grande do Norte' , 'Brasil', 'Loja Virtual', 1,0,6);
INSERT INTO tbven VALUES (13, '2015-07-01', 12, 'Cliente AAAF', 30, 1, 'F', 'Natal'         , 'Rio Grande do Norte' , 'Brasil', 'Loja Virtual', 1,0,5);
INSERT INTO tbven VALUES (14, '2015-06-02', 13, 'Cliente AAAG', 31, 4, 'M', 'São Luis'      , 'Maranhão'            , 'Brasil', 'Loja Virtual', 1,0,6);
INSERT INTO tbven VALUES (15, '2017-07-04', 14, 'Cliente AAAH', 32, 4, 'F', 'Florianópolis' , 'Santa Catarina'      , 'Brasil', 'Loja Virtual', 1,0,5);
INSERT INTO tbven VALUES (16, '2017-05-03', 15, 'Cliente AAAI', 33, 5, 'F', 'Aracaju'       , 'Sergipe'             , 'Brasil', 'Loja Virtual', 1,0,6);
INSERT INTO tbven VALUES (17, '2023-01-08', 16, 'Cliente WAAM', 19, 1, 'M', 'Eusébio'       , 'Ceará'               , 'Brasil', 'Loja Própria', 1,0,8);
INSERT INTO tbven VALUES (18, '2023-02-08', 16, 'Cliente WAAM', 19, 1, 'M', 'Eusébio'       , 'Ceará'               , 'Brasil', 'Loja Própria', 1,0,8);
INSERT INTO tbven VALUES (19, '2023-03-08', 16, 'Cliente WAAM', 19, 1, 'M', 'Eusébio'       , 'Ceará'               , 'Brasil', 'Loja Própria', 1,0,8);
INSERT INTO tbven VALUES (20, '2023-04-06', 7 , 'Cliente ABM' , 41, 2, 'F', 'Rio de Janeiro' , 'Rio de Janeiro' , 'Brasil', 'Loja Virtual', 1,1,3);

SELECT * FROM tbven;

CREATE TABLE tbven_item(
    cdvenitem   smallint primary key,
    cdpro       smallint NULL,
    qtven       int NULL,
    vruven      decimal(18, 2) NULL,
    vrtven      decimal(29, 2) NULL,
    cdven       smallint NULL
); -- drop table tbven_item

-- Adicionando foreign key - relacionamento com produto
ALTER TABLE tbven_item ADD CONSTRAINT "fk_vendas_item_produto" FOREIGN KEY ( cdpro ) REFERENCES tbpro ( cdpro );

-- Adicionando foreign key - relacionamento com a venda
ALTER TABLE tbven_item ADD CONSTRAINT "fk_vendas_item_venda" FOREIGN KEY ( cdven ) REFERENCES tbven ( cdven );


INSERT INTO tbven_item VALUES (1, 1, 4000 , 0.34, 0, 1);
INSERT INTO tbven_item VALUES (2, 1, 6000 , 0.34, 0, 1);
INSERT INTO tbven_item VALUES (3, 1, 4500 , 0.34, 0, 2);
INSERT INTO tbven_item VALUES (4, 1, 5000 , 0.34, 0, 3);


INSERT INTO tbven_item VALUES (8 , 1, 4000 , 0.34, 0, 5);
INSERT INTO tbven_item VALUES (9 , 1, 6000 , 0.34, 0, 6);
INSERT INTO tbven_item VALUES (10, 1, 4500 , 0.34, 0, 7);
INSERT INTO tbven_item VALUES (11, 1, 5000 , 0.34, 0, 7);
INSERT INTO tbven_item VALUES (12, 2, 300  , 1.50, 0, 8);
INSERT INTO tbven_item VALUES (13, 3, 4000 , 0.50, 0, 8);
INSERT INTO tbven_item VALUES (14, 1, 4000 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (15, 1, 6000 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (16, 1, 4500 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (17, 1, 5000 , 0.34, 0, 10);
INSERT INTO tbven_item VALUES (18, 2, 300  , 1.50, 0, 10);
INSERT INTO tbven_item VALUES (19, 3, 4000 , 0.50, 0, 11);
INSERT INTO tbven_item VALUES (20, 7, 4000 , 0.34, 0, 12);
INSERT INTO tbven_item VALUES (21, 7, 6000 , 0.34, 0, 13);
INSERT INTO tbven_item VALUES (22, 7, 4500 , 0.34, 0, 14);
INSERT INTO tbven_item VALUES (23, 1, 5000 , 0.34, 0, 14);
INSERT INTO tbven_item VALUES (24, 8, 300  , 1.50, 0, 15);
INSERT INTO tbven_item VALUES (25, 8, 4000 , 0.50, 0, 15);
INSERT INTO tbven_item VALUES (26, 1, 4000 , 0.34, 0, 16);
INSERT INTO tbven_item VALUES (27, 7, 6000 , 0.34, 0, 17);
INSERT INTO tbven_item VALUES (28, 7, 4500 , 0.34, 0, 18);
INSERT INTO tbven_item VALUES (29, 1, 5000 , 0.34, 0, 18);
INSERT INTO tbven_item VALUES (30, 2, 300  , 1.50, 0, 19);
INSERT INTO tbven_item VALUES (31, 6, 4000 , 0.50, 0, 20);
INSERT INTO tbven_item VALUES (32 , 1, 4000 , 0.34, 0, 5);
INSERT INTO tbven_item VALUES (33 , 1, 6000 , 0.34, 0, 6);
INSERT INTO tbven_item VALUES (34, 1, 4500 , 0.34, 0, 7);
INSERT INTO tbven_item VALUES (35, 1, 5000 , 0.34, 0, 7);
INSERT INTO tbven_item VALUES (36, 2, 300  , 1.50, 0, 8);
INSERT INTO tbven_item VALUES (37, 3, 4000 , 0.50, 0, 8);
INSERT INTO tbven_item VALUES (38, 1, 4000 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (39, 1, 6000 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (40, 1, 4500 , 0.34, 0, 9);
INSERT INTO tbven_item VALUES (41, 1, 5000 , 0.34, 0, 10);
INSERT INTO tbven_item VALUES (42, 2, 300  , 1.50, 0, 10);
INSERT INTO tbven_item VALUES (43, 3, 4000 , 0.50, 0, 11);
INSERT INTO tbven_item VALUES (44, 7, 4000 , 0.34, 0, 12);
INSERT INTO tbven_item VALUES (45, 7, 6000 , 0.34, 0, 13);
INSERT INTO tbven_item VALUES (46, 7, 4500 , 0.34, 0, 14);
INSERT INTO tbven_item VALUES (47, 1, 5000 , 0.34, 0, 14);
INSERT INTO tbven_item VALUES (48, 8, 300  , 1.50, 0, 15);
INSERT INTO tbven_item VALUES (49, 8, 4000 , 0.50, 0, 15);
INSERT INTO tbven_item VALUES (50, 1, 4000 , 0.34, 0, 16);
INSERT INTO tbven_item VALUES (51, 7, 6000 , 0.34, 0, 17);
INSERT INTO tbven_item VALUES (52, 7, 4500 , 0.34, 0, 18);
INSERT INTO tbven_item VALUES (53, 1, 5000 , 0.34, 0, 18);
INSERT INTO tbven_item VALUES (54, 2, 300  , 1.50, 0, 19);
INSERT INTO tbven_item VALUES (55, 6, 4000 , 0.50, 0, 20);

SELECT * FROM tbven_item;


----------------------
-- Lendo o comando: Seleciona todas as colunas da tabela: tbven e seus respectivos registros (linhas)
SELECT * FROM tbven;
SELECT * FROM tbpro;
SELECT * FROM tbvdd;
SELECT * FROM tbdep;


-- Warning: Evite o uso do *, seja específico, adicione apenas as colunas que irá precisar na sua análise.
-- Exemplo:

SELECT estcli AS Estado,
       cidcli AS Cidade
  FROM tbven;


-- *****
-- WHERE
-- *****
SELECT estcli AS Estado,
       cidcli AS Cidade
  FROM tbven
 WHERE cdcli = 16;
 
 
 -- ********
-- DISTINCT
-- ********
SELECT DISTINCT
       estcli AS Estado,
       cidcli AS Cidade
  FROM tbven
 WHERE cdcli = 16;

-- ************
-- LIMIT ou TOP
-- ************
SELECT *
  FROM tbven
 LIMIT 10;
-- Lendo o comando: Seleciona as 10 primeiras vendas (tbven)

-- **************
-- AND | OR | NOT
-- **************
-- Exemplo de AND

SELECT cdven  AS CodigoVenda,
	   cdcli  AS CodigoCliente,
       estcli AS Estado,
       cidcli AS Cidade,
	   dtven  AS DataVenda
  FROM tbven
 WHERE cdcli = 16
   AND dtven > '20230301';

-- Exemplo de OR
SELECT cdven  AS CodigoVenda,
	   cdcli  AS CodigoCliente,
       estcli AS Estado,
       cidcli AS Cidade,
	   dtven  AS DataVenda
  FROM tbven
 WHERE (cdcli = 16 or cdcli = 8);

-- Exemplo de NOT
SELECT cdven  AS CodigoVenda,
	   cdcli  AS CodigoCliente,
       estcli AS Estado,
       cidcli AS Cidade,
	   dtven  AS DataVenda
  FROM tbven
 WHERE NOT cdcli = 16
   AND dtven > '20230301';

-- ----------------------------------------------------
-- Somatório da quantidade de produtos vendidos (qtven)
-- ----------------------------------------------------
SELECT *
  FROM tbven_item;

SELECT SUM(qtven) AS quantidade_venda
  FROM tbven_item;

-- ------------------------------------------------
-- Média da quantidade de produtos vendidos (qtven)
-- ------------------------------------------------
SELECT AVG(qtven) AS media_quantidade_venda
  FROM tbven_item;

-- ---------------------------------------------
-- Maior quantidade de produtos vendidos (qtven)
-- ---------------------------------------------
SELECT MAX(qtven) AS maior_quantidade_venda
  FROM tbven_item;

-- ---------------------------------------------
-- Menor quantidade de produtos vendidos (qtven)
-- ---------------------------------------------
SELECT MIN(qtven) AS menor_quantidade_venda
  FROM tbven_item;

-- ------------------------------------------------------------
-- Contagem de produtos (quantos produtos temos na nossa base?)
-- ------------------------------------------------------------
SELECT *
  FROM tbpro;

SELECT count(cdpro) as qtd_produtos
  FROM tbpro;

-- ------------------------------------------------------------
-- Visualização única
-- ------------------------------------------------------------
SELECT SUM(qtven)   AS qtd, 'Quantidade de Venda - Somatório' AS descricao FROM tbven_item
UNION
SELECT AVG(qtven)   AS qtd, 'Quantidade de Venda - Média'     AS descricao FROM tbven_item
UNION
SELECT MAX(qtven)   AS qtd, 'Quantidade de Venda - Máxima'    AS descricao FROM tbven_item
UNION
SELECT MIN(qtven)   AS qtd, 'Quantidade de Venda - Minima'    AS descricao FROM tbven_item
UNION
SELECT count(cdpro) AS qtd, 'Quantidade de Produtos - Count'  AS descricao FROM tbpro;

-- ********
-- GROUP BY
-- ********
SELECT * FROM tbven;
  
SELECT estcli                AS Estado
     , count(DISTINCT cdcli) AS qtd_clientes
  FROM tbven
 GROUP BY estcli
 ORDER BY count(DISTINCT cdcli) DESC;

/* Necessidade: Seu cliente precisa de uma relação de quantidade de clientes por Estado
   Lendo o comando: Mostra o Estado e a quantidade de clientes naquele Estado, agrupando por Estado.
*/

SELECT * FROM tbven_item;

-- Quantidade comprada de um determinado produto
SELECT cdpro      AS Produto 
     , SUM(qtven) AS Qtd
  FROM tbven_item
 GROUP BY cdpro
 ORDER BY cdpro;


-- ******************************************
-- HAVING — Condições em Agrupamento de dados
-- ******************************************
-- https://www.w3schools.com/sql/sql_having.asp

SELECT * FROM tbven;

SELECT estcli                AS Estado
     , count(distinct cdcli) AS qtd_clientes
  FROM tbven
 GROUP BY estcli
HAVING count(distinct cdcli) > 1;

/* Lendo o comando: Mostra o Estado e a quantidade de clientes naquele Estado, agrupando por Estado, se a contagem de cliente for maior que 1.
*/

-- ************
-- IN | BETWEEN
-- ************
-- https://www.w3schools.com/sql/sql_in.asp
-- https://www.w3schools.com/sql/sql_between.asp

-- Exemplo de IN e BETWEEN
-- Moste o código da venda e o código do produto, quanto o produto for 2 ou 3 e o código de venda estiver entre 1 e 9.
SELECT cdven AS CodigoVenda,
       cdpro AS CodigoProduto
  FROM tbven_item
 WHERE cdpro IN (2,3)
   AND cdven BETWEEN 1 AND 9;

-- outro exemplo usando texto
SELECT *
  FROM tbpro
 WHERE nmpro IN ('Produto C', 'Produto A');

-- ****
-- LIKE
-- ****
-- https://www.w3schools.com/sql/sql_ref_like.asp
-- https://www.w3schools.com/sql/sql_wildcards.asp

SELECT *
  FROM tbpro
 WHERE nmpro LIKE '% C%';

-- outro exemplo
SELECT * 
  FROM tbpro
 WHERE nmpro LIKE ('%A');

-- ****
-- NULL
-- ****
-- https://www.w3schools.com/sql/sql_ref_is_null.asp

-- Código e Nome do Produto que tenha nulo...
SELECT cdpro,
       nmpro
  FROM tbpro
 WHERE slpro is null;
 
-- não tem saldo nulo
SELECT cdpro,
       nmpro
  FROM tbpro
 WHERE slpro is not null;
-- **********************
-- ORDER BY — Ordenar por
-- **********************
-- https://www.w3schools.com/sql/sql_ref_order_by.asp

SELECT *
  FROM tbven_item
 ORDER BY qtven DESC;

/* Lendo o comando: 
   Seleciona todos os registros relacionados a vendas (tabela: tbven_item), ORDENADOS das maiores quantidades (qtven) para as menores.
   
   Aqui vou começar a utilizar outras tabelas e mais campos.
   Lembre-se sempre, se puder ser o mais especifíco em relação as colunas que vai utilizar, melhor.
*/

-- *******************************************************************
-- TRIM | REPLACE | LPAD | REPLICATE | SUBSTRING | UPPER | LOWER | LEN
-- *******************************************************************

SELECT * FROM tbpro;

SELECT p.cdpro, -- Informação original (CodigoProduto)
       p.nmpro, -- Informação original (NomeProduto)
       TRIM(p.nmpro)                        AS TRIM, -- removendo espaços da coluna NomeProduto (o AS é dando um Alias, ou seja, um apelido para a coluna)
       REPLACE(p.nmpro, 'A', 'AA')          AS REPLACE, -- Substituido onde tiver A por AA no Tipo de Produto
       lpad(cast(p.cdpro as varchar),4,'0') AS LPAD,  -- Adiciona zeros a esquerda no código do produto até completar 9 dígitos - LPAD
       SUBSTRING(p.nmpro, 1, 3)             AS SUBSTRING, -- Pega os primeiros 3 caracteres da coluna de Nome do Produto 
       UPPER(p.nmpro)                       AS UPPER, -- Nome de Produto em maiúsculo
       LOWER(p.nmpro)                       AS LOWER, -- Nome de Produto em minúsculo
       LENGTH(p.nmpro)                      AS LENGTH -- Quantos caracteres tem o campo NomeProduto
  FROM tbpro AS p; -- o AS aqui, também é Alias, um apelido aqui no caso para Tabelas

/* Lendo o comando: 
   Aqui vou começar a utilizar outras tabelas e mais campos. Além de mais alguns recursos, como Alias (apelidos)
   Lembre-se sempre, se puder ser o mais especifíco em relação as colunas que vai utilizar, melhor.
*/

-- ****************************************************
-- CAST | CONVERT — Convertem um tipo de dados em outro
-- ****************************************************
-- https://www.w3schools.com/sql/sql_ref_sqlserver.asp

SELECT DISTINCT 
       c.cdcli,
       concat('Código - ', CAST(c.cdcli AS CHAR)) AS CodigoCliente_Texto
  FROM tbven c;
  
/* Lendo o comando: 
   Neste caso, o cliente precisava adicionar a palavra "Código - ", antes do código do Cliente
   Concatenamos (Comando CONCAT) a palavra solicitada com o código do cliente, 
   para concatenarmos, colocamos o código como texto usando o CAST (comando para converter tipos de dados)
*/

-- *********************************
-- DATE — Operações envolvendo datas
-- *********************************
-- https://www.w3schools.com/sql/sql_ref_sqlserver.asp

SELECT v.dtven                                as Data
     , date_part('day',v.dtven)               as Dia
     , date_part('month',v.dtven)             as Mes
     , date_part('year',v.dtven)              as Ano
     , to_char(dtven, 'DD-MM-YYYY')           as "Mes-Dia-Ano"
     , to_char(dtven, 'YYYY-MM-DD')           as "Ano-Mes-Dia"
     , to_char(dtven, 'YYYYMMDD')             as "AnoMesDia"
     , current_timestamp                      as hora_atual
     , extract(hour from current_timestamp)   as Hora
     , extract(minute from current_timestamp) as Minuto
  FROM tbven v;

-- *****************************************************************************************************************************
-- JOIN — Relacionamento entre tabelas — Operação que permite buscar informações de duas ou mais tabelas que estão relacionadas.
-- *****************************************************************************************************************************
-- https://blogdozouza.wordpress.com/2011/11/29/entendendo-os-tipos-de-joins/
-- https://www.w3schools.com/sql/sql_join.asp

-- -------------
-- Inner Join --
-- -------------
-- https://www.w3schools.com/sql/sql_join_inner.asp

-- O Inner Join é o método de junção mais conhecido e retorna os registros que são comuns às duas tabelas.
SELECT * FROM tbven_item;
SELECT * FROM tbpro;

-- Relacionando a tabela de vendas com a de produtos
SELECT *
  FROM      tbven_item ven
 INNER JOIN tbpro      pro ON pro.cdpro = ven.cdpro;

-- Boa prática
SELECT ven.cdven  as CodigoVenda
     , ven.qtven  as Quantidade
     , ven.vrtven as ValorTotal
     , pro.nmpro  as Produto
  FROM      tbven_item ven
 INNER JOIN tbpro      pro ON pro.cdpro = ven.cdpro;

-- -------------
-- Left Join --
-- -------------
-- https://www.w3schools.com/sql/sql_join_left.asp

-- O Left Join tem como resultado todos os registros que estão na tabela A (mesmo que não estejam na tabela B) 
-- e os registros da tabela B que são comuns à tabela A.
SELECT *
  FROM      tbven_item ven
  LEFT JOIN tbpro      pro ON pro.cdpro = ven.cdpro;

-- Exemplo com Vendedor e Dependente -- *
SELECT *
  FROM      tbvdd vdd
  LEFT JOIN tbdep dep ON dep.cdvdd = vdd.cdvdd;

SELECT *
  FROM      tbvdd vdd
  LEFT JOIN tbdep dep ON dep.cdvdd = vdd.cdvdd;

-- -------------
-- Right Join --
-- -------------
-- https://www.w3schools.com/sql/sql_join_right.asp

-- Usando o Right Join teremos como resultado todos os registros que estão na tabela B (mesmo que não estejam na tabela A) 
-- e os registros da tabela A que são comuns à tabela B.

SELECT *
  FROM      tbven_item ven
 RIGHT JOIN tbpro      pro ON pro.cdpro = ven.cdpro;

-- -------------
-- Outer Join --
-- -------------
-- https://www.w3schools.com/sql/sql_join_full.asp

-- O Outer Join (também conhecido por Full Outer Join ou Full Join) tem como resultado todos os registros que estão na tabela A e todos os registros da tabela B.
SELECT *
  FROM      tbven_item ven
  FULL JOIN tbpro      pro ON pro.cdpro = ven.cdpro;





