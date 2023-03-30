create table tbven(
	cdven int primary key,
	dtven date,
	cdcli int,  --FK
	qtven decimal (18,2));
	
create table tbcli(
	cdcli int primary key,
	nmcli varchar (60));

alter table tbven 
	add foreign key (cdcli) references tbcli(cdcli);

-- Inserir dados na tabela
insert into tbcli(cdcli,nmcli) values (1,'cliente 1');
insert into tbcli(cdcli,nmcli) values (2,'cliente 2');
insert into tbcli(cdcli,nmcli) values (3,'cliente 3');
insert into tbcli(cdcli,nmcli) values (4,'cliente 4');
insert into tbcli(cdcli,nmcli) values (5,'cliente 5');

select * from tbcli;

-- Vendas

insert into tbven (cdven, dtven, cdcli, qtven) values (1,'20030329',1,35.50);
insert into tbven (cdven, dtven, cdcli, qtven) values (2,'20030328',4,1.00);

select * from tbven;


-- Comando para juntar as tabelas
select * 
	from tbven v --v é o apelido para a tabela tbven
	join tbcli c on c.cdcli = v.cdcli




