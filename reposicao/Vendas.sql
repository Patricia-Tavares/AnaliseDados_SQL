CREATE TABLE tbvdd (
   cdvdd        smallint not null,
   nmvdd        varchar(20),
   sxvdd        smallint, -- 1 - M | 0 - F
   perccomissao decimal(19,2),
   matfunc      smallint not null
);


select *from tbvdd;

select * 
from tbven
where cdcli = 5;

select nmcli, cidcli, estcli
from tbven
where cdcli = 5;


select *from tbven;

select nmvdd, sxvdd
from tbvdd
where sxvdd ='1';


select * from tbven ven
join          tbvdd vdd on ven.cdvdd = vdd.cdvdd

-------------------------------------------

-- Criando as chaves primárias (DDL) - OK
ALTER TABLE tbvdd ADD PRIMARY KEY (cdvdd);

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
); 


INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 1' , '20100202', 'M' , 1, '11001887');

INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 2' , '20120405', 'M' , 3, '11001364'),
              ('Dependente 3' , '20130304', ' F', 3, '11001364'),
              ('Dependente 4' , '20100505', 'F' , 2, '11001666');

-- new insert
INSERT INTO tbdep (nmdep, dtnasc, sxdep, cdvdd, inepescola) 
       VALUES ('Dependente 4' , '20100505', 'F' , 2, '11001666');
	   

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
); 

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
);

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


SELECT * FROM tbven;
SELECT * FROM tbpro;
SELECT * FROM tbvdd;
SELECT * FROM tbdep;


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




---------------------------------------------------------------------------------------
---- Questão: Elabore consultas para os indicadores e solicitações abaixo: ----

-- Query = Select , From , Where

/*  
1 - Apresente uma consulta para listar o código e o nome do vendedor com maior número de vendas (contagem),
e que estas vendas estejam com o status concluído. As colunas apresentadas no resultado devem ser,
portanto, codigovendedor (cdvdd) e nomevendedor (nmvdd).
*/
select *from tbvdd
select *from tbven
select *from tbven_item

     /* Codigo do prof   */
--------------------------------
select vd.cdvdd as codigovendedo,
	   vd.nmvdd as nomevendedor,
	   count(cdven)
 from tbvdd as vd  -- como tem duas tabelas colocar apelido
 join tbven as v on v.cdvdd = vd.cdvdd -- para fazer a relação as colunas tem que ser as mesmas
 where v.stven = 1 -- concluido
 group by vd.cdvdd, vd.nmvdd -- agrupar pelo o que é igual e contar
 order by count(cdven) desc
 limit  1;



---------------------------------------------------------------------------
--- Meu codigo
select vd.cdvdd as codigovendedo, vd.nmvdd as nomevendedor

select * from tbven v
INNER JOIN tbvdd vd on v.cdvdd = vd.cdvdd
INNER JOIN tbven_item vi on v.cdven = vi.cdven 

select*from tbven_item vi
where vi.qtven = 6000 
--select max (qtven) as maior_venda from tbven_item;


/*  
2 - Apresente a query para listar o código e nome do produto mais vendido entre as datas de 
2014-02-03 até 2018-02-02. As colunas presentes no resultado devem ser codigoproduto (cdpro) e
nomeproduto (nmpro).
*/
--------------------------------
     /* Codigo do prof   */
--------------------------------
select pr.cdpro as codigoproduto,
	   pr.nmpro as nomeproduto
	--   count(cdven)
 from tbven v 
 join tbven_item vi on vi.cdven = v.cdven
 join tbpro         on pr.cdpro = vi.cdpro  -- como tem duas tabelas colocar apelido
 where v.dtven between '2014-02-03' and '2018-02-02' and v.stven = 1
 group by pr.cdpro, pr.nmpro
 order by sum (qtven) desc
-- limit = 1;




----------------------------
select cdpro as codigoproduto, nmpro as nomeproduto

select* from tbven v
join tbven_item vi on vi.cdven = v.cdven
join tbpro 	pro on pro.cdpro = vi.cdpro
where v.dtven between '2014-02-03' and '2018-02-02';

/* 
3 - Apresente uma consulta para listar o código e nome do cliente com maior gasto na loja. As coloridas
presentes no resultado devem ser codigocliente (cdcli), nomecliente (nmcli) e gasto, esta última
representando o somatório das vendas atribuídas ao cliente.
*/
--------------------------------
     /* Codigo do prof   */
--------------------------------
-- Pode fazer com o update

select v.cdcli as codigocliente,
	   v.nmcli as nomecliente, 
     --  sum (qtven*vrven) as gasto
 from tbven v 
 join tbven_item vi on vi.cdven = v.cdven
 where v.stven = 1
 group by v.cdcli, v.nmcli
 order by gasto desc
 limit = 1;



/*
4 - Apresente a query para listar código, nome e data de nascimento dos dependentes do vendedor
com menor valor total bruto em vendas (não sendo zero). As colunas presentes no resultado
devem ser codigodependente (cddep), nomedependente (nmdep), datanascimento (dtnasc).
*/

select cddep as codigodependente, nmdep as nomedependente, dtnasc as datanascimento, qtven as quantidadevendas
from tbdep, tbven_item
where tbdep.cddep = tbven_item.cdpro  and qtven = 300


/*
5 - Apresente a query para listar os 3 produtos menos vendidos pelos canais de E-Commerce ou
Matriz. As colunas presentes no resultado devem ser canalvendas(canal), codigoproduto
(cdpro), nomeproduto (nmpro) e quantidade_vendas.
*/
select canal as canalvendas, cdpro as codigoproduto, nmpro as nomeproduto


/*
6 - Apresente a query para listar o gasto médio por estado da federação. As colunas presentes no
resultado devem ser estado e gastomedio. Considere apresentar a coluna gastomedio
arredondada na segunda casa decimal.
*/





/*
7 - Apresente a query para listar o código das vendas (cdven) identificadas como deletadas.
Apresente o resultado em ordem crescente.
*/




/*
8 - Apresente a query para listar a quantidade média vendida de cada produto agrupado por estado
da federação. As colunas presentes no resultado devem ser estado e nomeproduto (nmprod) e
quantidade_media. Considere arredondar o valor da coluna quantidade_media na quarta casa
decimal. Ordene os resultados pelo estado (1º) e nome do produto (2º).
*/

select estcli as estado, nmpro as nomeproduto, qtven as quantidadevendas
from tbpro, tbven, tbven_item

select sum(qtven) 	 
from  tbven_item 


/*
9 - Calcule a receita bruta por ano.
*/




/*
10 - Calcule a receita bruta por ano e por estado.
*/





