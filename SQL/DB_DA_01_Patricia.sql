-- Criar tabelas
create table tbven(
	cdven int primary key,
	dtven date,
	cdpro int, -- FK
    cdvdd int, -- FK
	nmcli varchar(60),
	agecli int,
	clacli int,
	qtven decimal (18,2));
	
create table tbvdd(
	cdvdd int primary key,
	nmvdd varchar(60),
	matfunc int, 
	perccomissao decimal(19,2),
	sxvdd varchar(20));
	
create table tbpro(
	cdpro int primary key,
	nmpro varchar(30),
	tppro varchar(30),
	undpro varchar(30),
	slpro int,
	stpro varchar(20));
	
create table tbdep(
	cddep int primary key,
    nmdep varchar(60),
	dtnasc date,
	sxdep varchar(20),
	cdvdd int,
	inepescola varchar(20));

	
-- Adicionar as FK nas tabelas	
alter table tbven
	add foreign key (cdvdd) references tbvdd(cdvdd);
	
alter table tbven	
    add foreign key (cdpro) references tbpro(cdpro);
	
alter table tbdep	
    add foreign key (cdvdd) references tbvdd(cdvdd);
	
	
-- Inserir dados na tabela

insert into tbvdd (cdvdd,nmvdd,sxvdd) values (1,'Funcionario1',1);
insert into tbvdd (cdvdd,nmvdd,sxvdd) values (2,'Funcionario2',1);
insert into tbvdd (cdvdd,nmvdd,sxvdd) values (3,'Funcionario3',1);
select * from tbvdd

--insert into tbvdd values (2,'Funcionario 2',1, 1, 2);
--insert into tbvdd(nmvdd,matfunc,sxvdd) values ('Funcionario 2',2, 'F');
--insert into tbcli(cdcli,nmcli) values (3,'cliente 3');




-- Vendas

--insert into tbven values (1,'20030329',1,35.50);
--insert into tbven (cdven, dtven, cdcli, qtven) values (2,'20030328',4,1.00);

--select * from tbven

-- Comando para juntar as tabelas
--select * 
--	from tbven v --v é o apelido para a tabela tbven
--	join tbcli c on c.cdcli = v.cdcli






