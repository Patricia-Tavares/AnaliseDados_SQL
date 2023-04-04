-- Criando o banco de dados (DDL)
-- Mudar o SeuNome
CREATE DATABASE db_da_01_paty_test;

-- Setando o BD para uso

-- Criando a tabela de Vendedor (DDL)
---------------------------------------
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

-- Consultando dados (DQL)
SELECT * FROM tbvdd;

---------------------------------------
-- Criação da Tabela Dependente (DDL)
CREATE TABLE tbdep (
   cddep      INT GENERATED ALWAYS AS IDENTITY primary key,
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

-- Consultando (DQL)
SELECT * FROM tbdep;

---------------------------------------
-- Criação da Tabela de Produto (DDL)

CREATE TABLE tbpro(
    cdpro smallint primary key,
    nmpro varchar(50) NULL,
    tppro varchar(1) NULL,
    undpro varchar(2) NULL,
    slpro int NULL,
    stpro varchar(50) NULL
);

-- Populando tbpro (DML)
INSERT INTO tbpro VALUES (1, 'Produto A'  , 'A', 'KG' , 20000, 'Ativo');
INSERT INTO tbpro VALUES (2, 'Produto C'  , 'A', 'KG' , 5000 , 'Ativo');
INSERT INTO tbpro VALUES (3, 'Produto E'  , 'B', 'KG' , 2000 , 'Ativo');
INSERT INTO tbpro VALUES (5, 'Produto CH' , 'A', 'KG' , 2000 , 'Ativo');
INSERT INTO tbpro VALUES (6, 'Produto AB' , 'A', 'KG' , 100  , 'Inativo');

INSERT INTO tbpro VALUES (2, 'Produto CA' , 'A', 'KG' , 2000, 'Ativo');

-- Consultando (DML)
SELECT * FROM tbpro;

---------------------------------------
-- Criação da Tabela de Venda (DDL)

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

-- Adicionando foreign key - relacionamento com Vendedor
ALTER TABLE tbven ADD CONSTRAINT "fk_vendas_vendedor" FOREIGN KEY ( cdvdd ) REFERENCES tbvdd ( cdvdd );

-- populando tbven (DML)
INSERT INTO tbven VALUES (1, '2010-02-01', 1, 'Cliente AA' , 30, 3, 'M', 'Florianópolis', 'Santa Catarina'   , 'Brasil', 'Loja Própria', 1,0,1);
INSERT INTO tbven VALUES (2, '2022-07-08', 2, 'Cliente GRM', 57, 1, 'M', 'Gramado'      , 'Rio Grande do Sul', 'Brasil', 'Loja Virtual', 1,0,2);
INSERT INTO tbven VALUES (3, '2022-07-08', 3, 'Cliente ARM', 50, 1, 'F', 'Fortaleza'    , 'Ceará'            , 'Brasil', 'Loja Virtual', 1,0,4);
INSERT INTO tbven VALUES (4, '2022-07-08', 4, 'Cliente GRM', 57, 2, 'M', 'Canela'       , 'Rio Grande do Sul', 'Brasil', 'Loja Virtual', 1,0,2); -- Duplicidade de Cliente!

-- Consultando
SELECT * FROM tbven;

---------------------------------------
-- Criação da Tabela de Item de Venda (DDL)

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

-- populando tbven_item (DML)
INSERT INTO tbven_item VALUES (1, 1, 4000 , 0.34, 0, 1);
INSERT INTO tbven_item VALUES (2, 1, 6000 , 0.34, 0, 1);
INSERT INTO tbven_item VALUES (3, 1, 4500 , 0.34, 0, 2);
INSERT INTO tbven_item VALUES (4, 1, 5000 , 0.34, 0, 3);
INSERT INTO tbven_item VALUES (5, 2, 300  , 1.50, 0, 4);
INSERT INTO tbven_item VALUES (6, 3, 4000 , 0.50, 0, 4);

INSERT INTO tbven_item VALUES (7, 4, 2000 , 0.50, 0, 4); -- teste

SELECT * FROM tbven_item;

-- Insiram mais 50 registros de vendas e cada venda com no mínimo 2 itens, diversificar datas (ano, meses), diversificar estados e cidade, valores e etc...
-- Atenção aos produtos e valores unitários, sempre deixar um padrão de preço para cada produto
-- Depois de preencher tudo, atualizar o valor totak

-----------------------------
-- Praticar SQL - Comandos --
----------------------------- 