use hcode;
drop table pessoa;
drop table tb_funcionarios;

/*truncate limpa os dados da table*/
/*excluimos as tabelas mencionadas para que possamos cria-las novamente utilizando as chaves primarias e estrangeiras
corretas*/

/*PESSOA - LEFT*/
create table tb_pessoas(
	id_pessoa int auto_increment not null,
    desnome varchar(256) not null,
    dtcadastro  timestamp not null default current_timestamp(),
    constraint pk_pessoas primary key(id_pessoa)
);

/*FUNCIONARIOS RIGTH*/
create table tb_funcionarios (
	id_funcionario int auto_increment not null,
    id_pessoa int not null,
    vl_salario dec(10,2) not null default 1000.00,
    dtadmissao date not null,
    constraint pk_funcionarios  primary key (id_funcionario),
    constraint fk_funcionarios_pessoas foreign key (id_pessoa)
		references tb_pessoas(id_pessoa)
    );

insert into tb_pessoas values(NULL, 'Pedro Silva', NULL);
insert into tb_pessoas values(NULL, 'Maria da Silva', NULL);
insert into tb_pessoas values(NULL, 'Julian', NULL);
insert into tb_pessoas values(NULL, 'Juliana', NULL);
select * from tb_pessoas;
insert into tb_funcionarios values(NULL, 1, 5000.00, CURRENT_DATE());
insert into tb_funcionarios values(NULL, 2, 5000.00, CURRENT_DATE());
select * from tb_funcionarios;

select * 
from tb_funcionarios a
inner join tb_pessoas b on a.id_pessoa = b.id_pessoa;

select *
from tb_funcionarios
inner join tb_pessoas using(id_pessoa);

select *
from tb_funcionarios
left outer join  tb_pessoas using(id_pessoa);

select *
from tb_funcionarios
right outer join  tb_pessoas using(id_pessoa);


select * from
tb_pessoas where desnome like 'J%';

delete from tb_pessoas where id_pessoa in
	(select id_pessoa from tb_pessoas where desnome like 'J%');

select * from tb_pessoas;
