-- Criar o banco de dados E-commerce
create database market_express;

-- Usar o banco de dados E-commerce
use market_express;

-- Tabela Usuário
create table usuario (
    userID INT PRIMARY KEY not null auto_increment,
    nome VARCHAR(255),
    email VARCHAR(255),
    entregaID int,
    cobrancaID int
);
describe usuario;


-- Tabela Pedido
create table pedido (
    pedidoID INT PRIMARY KEY not null auto_increment,
    dataPedido DATETIME,
    userID INT,
    entregaID INT,
    cobrancaID INT,
    produtoID int
    );
 
 describe pedido;
 
-- Tabela Pagamento
create table pagamento (
    cobrancaID INT PRIMARY KEY,
    metodopagamento VARCHAR(255),
    userID INT,
    valor FLOAT,
    datapagamento DATETIME
    );
describe pagamento;
    
-- Tabela Endereço
create table endereco (
    entregaID INT PRIMARY KEY not null auto_increment,
    rua VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255),
    cep INT
);
describe endereco;

-- Tabela Produtos
create table produtos (
	produtoID int primary key not null	auto_increment,
    produto varchar (255),
    descricao varchar (255),
    valor float
    ) engine = InnoDB;
describe produtos;