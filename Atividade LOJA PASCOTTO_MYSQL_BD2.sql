CREATE DATABASE LojaPascotto;

USE LojaPascotto;

CREATE TABLE Clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome_cliente VARCHAR(80) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    cpf VARCHAR(250) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Cargos(
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL,
    descricao_cargo VARCHAR(250) NOT NULL
);

CREATE TABLE Funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    salario DOUBLE NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES Cargos (id_cargo)
);

CREATE TABLE Produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produtos VARCHAR(100) NOT NULL,
	preco DOUBLE NOT NULL,
    estoque DOUBLE,
    cor VARCHAR(250) NOT NULL,
	fabricante VARCHAR(250) NOT NULL
);

CREATE TABLE Pedidos(
	id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
);

CREATE TABLE itensPedidos(
	id_itens INT AUTO_INCREMENT PRIMARY KEY,
	quantidade_itens INT NOT NULL,
	preco_itens DOUBLE NOT NULL,
    id_produtos INT,
    id_pedidos INT,
    FOREIGN KEY (id_pedidos) REFERENCES Pedidos (id_pedidos),
    FOREIGN KEY (id_produtos) REFERENCES Produtos (id_produto)
);

INSERT INTO Clientes (nome_cliente, data_nascimento, endereco, cpf, email) VALUES
('Mauricia', '1990-05-12', 'Rua A', '913.426.756-77', 'Mauricia@gmail.com'),
('Guilda', '1985-03-22', 'Rua B', '234.427.530-12', 'Guilda@gmail.com'),
('Kian', '1992-11-15', 'Rua C', '115.428.643-25', 'Kian@gmail.com'),
('Polus', '1988-07-30', 'Rua D', '312.239.012-37', 'Polus@gmail.com'),
('Eduard', '1995-02-18', 'Rua E', '123.234.764-46', 'Eduard@gmail.com'),
('Figueredo', '1993-09-10', 'Rua F', '123.287.223-34', 'felipec@gmail.com'),
('hian', '1987-12-05', 'Rua G', '246.567.327-12', 'Figueredo@gmail.com');

INSERT INTO Cargos (nome_cargo, descricao_cargo) VALUES
('Gerente', 'O gerente é, com certeza, um dos...'),
('Empacotador.', 'O empacotador é essencial para supermercados...'),
('Suporte T.I.', 'Responsavel por manter o sistema funcionando.'),
('Padeiro', 'Responsavel por produzirem pães, bolos...'),
('Estoquista', 'Gerencia o estoque de produtos...'),
('Auxiliar administrativo', ' o auxiliar administrativo é essencial...'),
('Segurança', 'responsável pela prevenção de perdas, é importante ...');

INSERT INTO Funcionarios (nome_funcionario, endereco, salario, departamento, cargo, id_cargo) VALUES
('Ze Joao', 'Rua das Flores, 249', 3500.00, 'Serviços', 'Supervisor', 1),
('Ze Julio', 'Av. Central, 594', 2800.00, 'Serviços', 'Padeiro', 2),
('Ze Cleiton', 'Rua Nova, 463', 10000.00, 'TI', 'Suporte T.I.', 3),
('Ze Buxexa', 'Rua do Comércio, 901', 5200.00, 'Gestao', 'Gerente', 4),
('Ze Valdo', 'Rua dos Trilhos, B12', 2500.00, 'Estoque', 'Estoquista', 5),
('Ze Figueredo', 'Av. Brasil, 13', 3900.00, 'Gestao', 'Auxiliar administrativo', 6),
('Ze Lucas', 'Rua Azul, 124', 3100.00, 'Segurança', 'Segurança', 7);

INSERT INTO Produtos (nome_produtos, preco, estoque, cor, fabricante) VALUES
('Camisa Polo Renner', 75.00, 10, 'Azul', 'Renner'),
('Tênis Nike', 199.90, 50, 'Preto', 'Nike'),
('Calca de sarja', 159.99 , 55, 'Azul Escuro', 'C&A'),
('Bone Puma', 59.50, 23, 'Vermelho', 'Puma'),
('Jaqueta Corta-Vento Adidas', 450.00, 210, 'Verde', 'Adidas'),
('Meia Algodao Nike', 55.00, 54, 'Branca', 'Nike'),
('Relogio Digital', 1000.00, 12, 'Cinza', 'Orient');

INSERT INTO Pedidos (data_pedido, id_cliente) VALUES
('2025-03-02', 1),
('2025-05-08', 2),
('2025-05-07', 3),
('2025-05-06', 4),
('2025-05-05', 5),
('2025-05-04', 6),
('2025-05-03', 7);

INSERT INTO ItensPedidos (quantidade_itens, preco_itens, id_produtos, id_pedidos) VALUES
(5, 179.90, 1, 1),
(3, 168.90, 2, 2),
(2, 120.99, 3, 3),
(1, 1000.00, 4, 4),
(4, 55.00, 5, 5),
(2, 450.00, 6, 6),
(3, 281.00, 7, 7);