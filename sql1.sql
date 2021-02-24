create database hcode;
use hcode;

create table cliente(
	id int,
    nome varchar(100));
    
insert into cliente values(1,'Amanda Constante');
insert into cliente (nome,id) values ('Cássio Filippi',2);

select * from cliente;

drop database hcode;
create database hcode;
use hcode;

create table tb_funcionarios (
	id int,
    nome varchar(100),
    salario decimal(10,2),
    admissao date,
    sexo enum('f','m'),
    cadastro timestamp default current_timestamp(),
    primary key(id)
);
insert into tb_funcionarios values(1,'Amanda',10000.99, '2020-02-02','f', NULL);
describe tb_funcionarios;
select * from tb_funcionarios;

update tb_funcionarios 
set salario = salario*1.1
where id=1;

delete from tb_funcionarios;

insert into pessoa values(1,'Pedro Henrique','M'); /* posicional */
insert into pessoa (nome,sexo) values ('Maria Josefina','F');/* declarativo, posso pular uma coluna, nesse caso o id nao precisaria ser preenchido pq eh auto incremet */
insert into pessoa (nome,sexo) values 
('Mario','M'),
('Divanei', 'M'),
('Luis', 'M'),
('Daniela', 'F')
;

insert into tb_funcionarios(select id, nome, 950, current_date(), sexo, NULL from pessoa); /*copiar dados da tabela pessoa para outra*/

select * from tb_funcionarios;

select count(*) as total from tb_funcionarios; /*count retorna quantas linhas retornaram dessa consulta*/

select nome, salario as salario_atual,
convert (salario*1.1, dec(10,2)) as salario_com_aumento
 from tb_funcionarios;
 
 select * from tb_funcionarios where nome like 'j%';
  select * from tb_funcionarios where nome not like 'p%';
 select * from tb_funcionarios where nome like '___a%';

select * from tb_funcionarios where salario between 100 AND 2000;

select * from tb_funcionarios where soundex(nome) = soundex('mario'); /*faz uma busca fonetica, traz todos que soem como mario*/

select * from tb_funcionarios where cadastro > '2016-01-01';
update tb_funcionarios set admissao = current_date() where id=1;
update tb_funcionarios set admissao = date_add(current_date(), interval 50 day) where id=2; /* date add soma x dias na data salva*/
select * from tb_funcionarios;

select datediff(admissao ,current_date()) as diferenca from tb_funcionarios where id=2;