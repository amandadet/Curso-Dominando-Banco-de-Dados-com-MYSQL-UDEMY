use hcode;

create table tb_pedidos(
	id_pedido int auto_increment not null,
    id_pessoa int not null,
    dtpedido datetime not null,
    vlpedido dec(10,2) not null,
    constraint pk_pedidos primary key (id_pedido),
    constraint fk_pedidp_pessoa foreign key (id_pessoa)
    references tb_pessoas(id_pessoa));
    
    select * from tb_pessoas;
    
insert into tb_pedidos values (NULL,1,current_date(), 22000.00);
insert into tb_pedidos values (NULL,1,current_date(), 5000.00);
insert into tb_pedidos values (NULL,1,current_date(), 10000.00);
insert into tb_pedidos values (NULL,1,current_date(), 3000.00);

insert into tb_pedidos values (NULL,1,current_date(), 1999.00);
insert into tb_pedidos values (NULL,1,current_date(), 2000.00);

insert into tb_pedidos values (NULL,3,current_date(), 1999.00);
insert into tb_pedidos values (NULL,3,current_date(), 2000.00);

select sum(vlpedido) as total_valor, 
convert(avg(vlpedido), dec(10,2)) as media_valor, 
convert(min(vlpedido), dec(10,2)) as menor_valor,
convert(max(vlpedido), dec(10,2)) as maior_valor,
count(*) as total_de_pedidos,
desnome from tb_pedidos a inner join tb_pessoas b using(id_pessoa) group by id_pessoa order by sum(vlpedido);

/*where coloca condicao na coluna da tabela*/

select sum(vlpedido) as total_valor, 
convert(avg(vlpedido), dec(10,2)) as media_valor, 
convert(min(vlpedido), dec(10,2)) as menor_valor,
convert(max(vlpedido), dec(10,2)) as maior_valor,
count(*) as total_de_pedidos,
desnome from tb_pedidos a inner join tb_pessoas b using(id_pessoa) group by id_pessoa
having sum(vlpedido)>5000.00
order by sum(vlpedido);

/*having so pode ser usado com o group by*/

create view v_pedidos_totais 
as 
select sum(vlpedido) as total_valor, 
convert(avg(vlpedido), dec(10,2)) as media_valor, 
convert(min(vlpedido), dec(10,2)) as menor_valor,
convert(max(vlpedido), dec(10,2)) as maior_valor,
count(*) as total_de_pedidos,
desnome from tb_pedidos a inner join tb_pessoas b using(id_pessoa) group by id_pessoa
order by sum(vlpedido);

select * from v_pedidos_totais;

delimiter $$
create procedure pessoa_save(
pdesnome varchar(255)
)
begin
	insert into tb_pessoas values (null, pdesnome,null);
    select * from tb_pessoas  where id_pessoa=last_insert_id();
end$$
delimiter ;

call pessoa_save('Teste');

/*procedures views provmovem segurança, pois o prigramador não sabe como que ocorreu dentro do banco de dados*/


delimiter $$
create procedure sp_funcionario_save(
pdesnome varchar(256),
 pvlsarario dec(10,2),
 pdtadmissao datetime
)
begin
	declare vidpessoa int;
	start transaction;
		if not exists (select id_pessoa from tb_pessoas where desnome = pdesnome) 
			then insert into tb_pessoas values(null,pdesnome,null);
			set vidpessoa = las_insert_id;
		else 
			select 'Usuario nao cadastrado' as resultado;
			rollback;
		end if
		commit;
		select 'Dados cadastrados com sucesso' as resultado;
end $$

delimiter ;
