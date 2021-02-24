use hcode;
select * from tb_funcionarios where month(admissao)=2;
select nome from tb_funcionarios where month(admissao) between 2 and 10;
/*tbm existem funcoes year, day*/

select * from tb_funcionarios order by nome;
select * from tb_funcionarios order by 2; /*ordena pela segunda col da table*/

update tb_funcionarios set salario=1000.00 where id =1;
update tb_funcionarios set salario=1558.00 where id =2;
update tb_funcionarios set salario=3000.00 where id =6;

select * from tb_funcionarios order by salario desc, nome desc;
select * from tb_funcionarios order by salario asc;

select * from tb_funcionarios order by salario desc limit 0,3;

select * from tb_funcionarios where year(cadastro)=2021
order  by salario desc limit 0,5;

update tb_funcionarios set salario=4000, admissao = '2015-12-20' where id=4;
select * from tb_funcionarios where id=4;

delete from tb_funcionarios where id=1;
/*deleta todos os dados da linha da table*/

start transaction;
delete from pessoa;
select * from pessoa;
rollback; 
commit; /*confirma*/
/*transacao funciona como um ctrl z, se iniciar uma transação e excluir os dados de pessoa, usando o rollback pderei voltar 
atras*/

insert into pessoa values(NULL, 'José','m');

truncate table pessoa;
select*from pessoa;