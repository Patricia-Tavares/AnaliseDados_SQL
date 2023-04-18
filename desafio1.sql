create table tbpessoa (
	cod smallint primary key,
	nome varchar(20),
	cpf varchar(20),
	datanasc date);
	
--insert into tbpessoa values (cod,nome,cpf,datanasc);
	   	   
INSERT INTO tbpessoa VALUES (1 , 'Pessoa 1', '05911111111' , '2010-02-01' ); 
INSERT INTO tbpessoa VALUES (2 , 'Pessoa 2', '05912222222' , '2022-07-08' ); 
INSERT INTO tbpessoa VALUES (3 , 'Pessoa 3', '05913455621' , '2000-04-05' ); 
INSERT INTO tbpessoa VALUES (4 , 'Pessoa 4', '05900000000' , '2001-10-06' ); 
INSERT INTO tbpessoa VALUES (5 , 'Pessoa 5', '05988888888' , '2007-08-01' ); 
INSERT INTO tbpessoa VALUES (6 , 'Pessoa 6', '05977777777' , '1999-11-30' ); 
INSERT INTO tbpessoa VALUES (7 , 'Pessoa 7', '05954324566' , '1993-03-08' ); 
INSERT INTO tbpessoa VALUES (8 , 'Pessoa 8', '05999999999' , '2000-01-28' ); 
INSERT INTO tbpessoa VALUES (9 , 'Pessoa 9', '05933333333' , '1996-05-08' ); 
INSERT INTO tbpessoa VALUES (10 , 'Pessoa 10', '05966666666' , '1994-12-10' ); 
	   
SELECT * FROM tbpessoa;	   

--alterar a datanasc do cod de número 5 para 08/03/2022

update tbpessoa
set datanasc = '2022-03-08' where cod = 5;
SELECT * FROM tbpessoa;

--Deletar o registro do cod de número 10
delete from tbpessoa where cod=10;

-- Alterar o tipo de dado do campo: cod para smallint, se tiver smallint, mude para bigint
alter table tbpessoa 
alter column cod type bigint






