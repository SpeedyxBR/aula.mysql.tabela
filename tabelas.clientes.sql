-- Criação do banco de dados Loja
CREATE DATABASE IF NOT EXISTS Loja;

-- Usando o banco de dados Loja
USE Loja;

-- Excluindo a tabela clientes caso ela já exista
DROP TABLE IF EXISTS clientes;

-- Criando a tabela clientes
CREATE TABLE clientes (
    cod_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) UNIQUE NOT NULL,
    Endereco VARCHAR(255),
    Cidade VARCHAR(255),
    Cep VARCHAR(10),
    Ultimo_Acesso DATETIME,
    Saldo DECIMAL(10, 2) DEFAULT 0.00
);

-- Inserindo dados na tabela clientes
INSERT INTO clientes (Nome, Endereco, Cidade, Cep, Ultimo_Acesso, Saldo) 
VALUES ('João Silva', 'Rua das Flores, 123', 'São Paulo', '12345-678', NOW(), 100.00);

-- Consultando os dados inseridos na tabela clientes
SELECT * FROM clientes;

-- Excluindo a tabela pedidos caso ela já exista
DROP TABLE IF EXISTS pedidos;

-- Criando a tabela pedidos
CREATE TABLE pedidos (
    cod_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT UNSIGNED,
    Data_Pedido DATETIME DEFAULT NOW(),
    Valor DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente) ON DELETE CASCADE
);

-- Inserindo dados de pedidos
INSERT INTO pedidos (cod_cliente, Valor, Status)
VALUES (1, 250.75, 'Pendente');

-- Consultando os dados inseridos na tabela pedidos
SELECT * FROM pedidos;

-- Consultando os clientes
SELECT * FROM clientes;


