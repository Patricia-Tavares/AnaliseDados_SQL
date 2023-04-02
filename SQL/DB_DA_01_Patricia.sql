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

--insert into tbvdd(cdvdd,nmvdd,matfunc,sxvdd) values (1,'Funcionario 1',1, 'M');
--insert into tbvdd(nmvdd,matfunc,sxvdd) values ('Funcionario 2',2, 'F');
--insert into tbcli(cdcli,nmcli) values (3,'cliente 3');

--select * from tbvdd


-- Vendas

insert into tbven (cdven, dtven, cdvdd, qtven) values (1,'20030329',1,35.50);
--insert into tbven (cdven, dtven, cdcli, qtven) values (2,'20030328',4,1.00);

select * from tbven

-- Comando para juntar as tabelas
--select * 
--	from tbven v --v é o apelido para a tabela tbven
--	join tbcli c on c.cdcli = v.cdcli






