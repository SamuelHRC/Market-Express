-- 1. Indicar campos de ordenamento (campos & Desc/asc)
delimiter $$
create procedure sp_get_pedido_order_degr (in field char(20), in degree char(20))
begin
	-- 1. Níve de IF (se o field não for em branco)
	if (field <> '') then
		-- 2. Nível de IF (grau = desc/asc)
			if (degree = "asc") then
				set @pedido_order_degr = concat('order by ', field ," asc");
			else 
				set @pedido_order_degr = concat('order by ', field , " desc");
			end if;
    else
    -- Caso contrário, não faça nada
		set @pedido_order = ''; 
	end if;
        
	set @clausula = concat('select * from pedido ', @pedido_order_degr); -- olha o espaço no final do pedido__'
    prepare runSQL from @clausula;
    execute runSQL;
    deallocate prepare runSQL;
    end; $$
delimiter ;
-- Exemplo
-- call sp_get_pedido_order_degr(datapedido, "asc");


-- 2. Inserção de registros na tabela pedido
-- select * from produtos;

delimiter $$

create procedure sp_insert_registros_produto(in sp_produto varchar(255), sp_descricao varchar(255), sp_valor float)
begin
	-- 1. Se o parameter do produto for vazio ''
    if sp_produto = '' then
		select "ERRO: parâmetro produto vazio";
	else -- do contrário;
		 -- Inserção dos dados do novo registro
        insert into produtos(produto, descricao, valor) values(sp_produto, sp_descricao, sp_valor);
         -- Rodando query
	prepare runSQL from "select produtoID, produto, descricao, valor from produtos"; 
	execute runSQL;
    deallocate prepare runSQL;
    end if;
end; $$

delimiter ;

-- Exemplo
-- call sp_insert_registros_produto('Aveia', 'Nacional', 8);
