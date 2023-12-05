-- 1º Função
/* 
Número de pedidos feitos por um usuário
*/
delimiter $$
CREATE FUNCTION fn_total_pedidos_usuario (user int) 
	RETURNS int
    DETERMINISTIC
BEGIN
	declare resultado int; 
	-- Conta o número de pedidos feitos por um usuário
    set resultado = (select count(*)
					from pedido
                    where userID = user);
RETURN resultado;
END $$

delimiter ;

select * from pedido;
-- Test da função 1
select userID, count(userID)
from pedido
where userID = 48;


-- 2º Função 
/*
Calculo o total gasto por um usuário
*/

delimiter $$
CREATE FUNCTION `valor_total_gasto_usuario`(user_id INT) 
RETURNS DECIMAL(10, 2)
Deterministic
BEGIN
    DECLARE total DECIMAL(10, 2);
    -- Obtém o total gasto por um usuário
    SET total = (select sum(Valor)
				from extratodevendas
				group by Usuario
				having Usuario = user_id);
RETURN total;
END $$
delimiter ;

-- Test da function 2 (userID = 126)
select round(sum(Valor),2)
from extratodevendas
group by Usuario
having Usuario = 126;