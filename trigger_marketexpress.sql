-- 1. TABLE LOG: Detectar a exclusão de um registro após a operação
create table pedido_delete_log (
	pedidoID int auto_increment primary key,
    usuario varchar (100),
    data_ date,
	hora_ time
);

use market_express; 
-- 1. TRIGGER - Pedido
/*
- Associado a TABLE (é a table que ao sofrer uma oparação DML irá disparar um gatilho):
- TABLE relacionado a operação do TRIGGER (Log, Registro ou Auditoria): 
*/
create trigger tr_delete_pedido
after delete on pedido -- desistência/ cancelamento
for each row
insert into pedido_delete_log
values (old.pedidoID, user(), current_date(), current_time()) -- ao invés de (new) colocamos (old): pedimos para usar um dado antigo [que já foi deletado]
;

 -- Teste 
 select * from pedido;
 
 delete from pedido
 where pedidoID = 3;

 select * from pedido_delete_log; -- Funcionou (Check)
 
  select * from pedido
  where pedidoID = 3;
 
 
 

-- 2. TABLE LOG: Detectar a atualização de um registro antes da operação
create table pedido_update_log (
	pedidoID int auto_increment primary key,
    usuario varchar (100),
    data_ date,
	hora_ time
);

-- 2.TRIGGER - Pedido
/*

*/
create trigger tr_update_pedido
before update on pedido
for each row
insert into pedido_update_log
values (new.pedidoID, user(), current_date(), current_time()) -- ao invés de (new) colocamos (old): pedimos para usar um dado antigo [que já foi atualizado]
;

-- Teste
 select * from pedido
 where produtoID = 40;
 
 update pedido
 set produtoID = 200
 where produtoID = 40;
 
select * from pedido
where produtoID = 200;

 select * from pedido_update_log; -- Funcionou (Check)


-- 3. TABLE LOG: Detectar a inclusão de um registro antes da operação
create table produto_insert_log (
	pedidoID int auto_increment primary key,
    usuario varchar (100),
    data_ date,
	hora_ time
);
  


-- TRIGGER 3 - Produtos
/*
*/
create trigger tr_insert_produto
before insert on produtos
for each row
insert into produto_insert_log
values (new.produtoID, user(), current_date(), current_time()) 
;
select * from produtos;

insert into produtos
values (produtoID, "Sal", "Nacional", 10.50);

select * from produto_insert_log;

select * from produtos
where produto = "Sal";

-- 4. TABLE LOG: Detectar a exclusão de um registro depois da operação
create table produto_delete_log (
	pedidoID int auto_increment primary key,
    usuario varchar (100),
    data_ date,
	hora_ time
);
  

select * from produtos;

-- TRIGGER 4 - Produtos

create trigger tr_delete_produto
after delete on produtos
for each row
insert into produto_delete_log
values (old.produtoID, user(), current_date(), current_time()) 
;

 -- Teste 
 select * from produtos;
 
 delete from produtos
 where produtoID = 1;

 select * from produtos
 where produtoID = 1;

select * from produto_delete_log;