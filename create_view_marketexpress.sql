-- VIEWS - 1
/*
Obter número de pedidos por usuário, permitindo ao analista
criar um possível mapeamento do perfil do usuário e outros insigths;
*/
select * from pedido;

create view Num_PedidosPorUsuario as
	(select userID, count(*) as Total
	from pedido
	group by userID
	order by total desc);
select * from Num_PedidosPorUsuario;


-- VIEW - 2
/*
Fornece os principais campos que detalham as vendas, na pespectiva
de avaliar apenar o faturamento. Sem adentrar no nome do usuário, para fins
de limitar o acesso e seguir um possível escopo interno de LGPD (Lei Geral
de Proteção dos Dados).
*/

select * from pedido;
select * from produtos;

create view extratodevendas as(	
	select pedido.pedidoID as Pedido, pedido.userID Usuario, pedido.produtoID, produtos.produto as Produto, produtos.valor as Valor
	from pedido
	join produtos
	on pedido.produtoID = produtos.produtoID);
select * from extratodevendas;


-- VIEW - 3
/*
Mostra o total das vendas por produto, possibilitando
aprofundar no entendimento dos produtos que apresentam
maior saída.
*/
select * from produtos;
select * from pedido; 

create view totalporproduto as(
	select produto as Produto, sum(valor) as Total
	from extratodevendas
	group by Produto 
	order by Total desc);
select * from totalporproduto;


-- VIEW - 4
/*
Mapeamento dos produtos são que tenham linha nacional e internacional.
*/

select * from produtos;

create view produtosestrageiros as ( 
	select produto, count(produto) as total 
	from produtos
	group by produto
	having total >= 2);
select * from produtosestrageiros;





-- VIEW - 5
/*
Apresenta o faturamento anual;
*/
select * from pagamento;
select * from pedido;

create view faturamentoanual as (
	select round(sum(valor),2) as Faturado, year(datapagamento) as Ano
	from pagamento
	group by Ano
    order by Ano);
select * from faturamentoanual;