use vendas;
create table tb_clientes(
  id int primary key auto_increment,
  nome varchar(45)
);

 create table tb_vendas(
    id int primary key auto_increment,
    data date,
    status char default 'A',
    tb_clientes_id int,
    foreign key(tb_clientes_id) references tb_clientes(id)
 );

create table tb_categorias(
 id int primary key auto_increment,
 nome varchar(20)
 );
 
 create table tb_produtos(
    id int primary key auto_increment,
    descricao varchar(45),
    valorUnitario decimal(8,2),
    estoque decimal(8,2),
    tb_categorias_id int,
    foreign key(tb_categorias_id) references tb_categorias(id)    
 );
 
 create table tb_itens_venda(
     tb_vendas_id int,
     tb_produtos_id int,
     quantidade decimal(8,2),
     preco decimal(8,2),
     foreign key(tb_vendas_id) references tb_vendas(id),
     foreign key(tb_produtos_id) references tb_produtos(id)
 );
 
insert into tb_categorias(nome)values('Cereais'),('Açougue'),('Frios');
select * from tb_categorias;

insert into tb_produtos(descricao, valorUnitario, estoque, tb_categorias_id)
values('Milho',10.55, 10, 1),('Trigo',7.50, 30, 1);

insert into tb_produtos(descricao, valorUnitario, estoque, tb_categorias_id)
values('Alcatra', 22.99, 2, 2),('Costela',19.50, 5, 2);

insert into tb_produtos(descricao, valorUnitario, estoque, tb_categorias_id)
values('Queijo',14.79, 2, 3),('Nata',3.50, 30, 3);

insert into tb_produtos(descricao, valorUnitario, estoque, tb_categorias_id)
values('Manteiga',4.79, 2, 3),('Iogurte',1.99, 30, 3);
select * from tb_produtos;

insert into tb_clientes(nome)values('lucas'),('felipe');
select * from tb_clientes;

insert into tb_vendas(data, tb_clientes_id)values('2023-09-10',1),('2023-10-10',1);
insert into tb_vendas(data, tb_clientes_id)values('2023-08-10',1),('2023-08-30',2);
insert into tb_vendas(data, tb_clientes_id)values('2023-07-10',1),('2023-07-30',2);

select * from tb_vendas;

insert into tb_itens_venda(tb_vendas_id,tb_produtos_id,quantidade, preco)
values(1,1,2,10.55),(1,2,1,7.50);

insert into tb_itens_venda(tb_vendas_id,tb_produtos_id,quantidade, preco)
values(2,1,2,10.55),(2,2,1,7.50),(2,3,3,22.99);

insert into tb_itens_venda(tb_vendas_id,tb_produtos_id,quantidade, preco)
values(3,1,2,10.55),(3,2,1,7.50);

insert into tb_itens_venda(tb_vendas_id,tb_produtos_id,quantidade, preco)
values(4,1,2,10.55),(4,2,1,7.50),(4,3,3,22.99);

select * from tb_itens_venda;

select min(valorUnitario) from tb_produtos;

select max(valorUnitario) from tb_produtos;

select count(*) from tb_produtos;

select sum(estoque) from tb_produtos;

select avg(estoque) from tb_produtos;

select * from tb_produtos;

select tp.id, tp.descricao, tc.nome as categoria, ti.quantidade,
ti.preço, (ti.quantidade * ti.preço) as subtotal
from tb_itens_venda ti
inner join tb_produtos tp on tp.id = ti.tb_produtos_id
inner join tb_categorias tc on tc.id = tp.tb_categorias_id
where ti.tb_vendas_id = 9;