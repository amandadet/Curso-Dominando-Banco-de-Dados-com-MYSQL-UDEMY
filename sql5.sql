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
