CREATE DATABASE naranerd;
USE naranerd;

CREATE TABLE clientes (
id_cliente INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR (150),
cidade VARCHAR (100) NOT NULL);

CREATE TABLE produtos (
id_produto INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
categoria VARCHAR(150) NOT NULL,
preco DECIMAL (10,2));


CREATE TABLE vendedores (
id_vendedor INT PRIMARY KEY,
nome VARCHAR(100),
loja VARCHAR(150));

CREATE TABLE vendas (
id_venda INT PRIMARY KEY,
id_cliente INT NOT NULL,
id_vendedor INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT,
valor DECIMAL(10,2),
data_venda DATE,
FOREIGN KEY (id_produto)
REFERENCES produtos (id_produto),
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente));



LOAD DATA INFILE "C/Users/felipe.espirito/Downloads/naranerd_vendas.csv"
INTO TABLE vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(id_venda,id_produto,id_loja,quantidade,valor,data_venda);

LOAD DATA INFILE "C/Users/felipe.espirito/Downloads/naranerd_produtos.csv"
INTO TABLE produtos 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_produto,nome,categoria,preco);


LOAD DATA INFILE "C/Users/felipe.espirito/Downloads/naranerd_clientes.csv"
INTO TABLE clientes 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_cliente,nome,email,cidade);

LOAD DATA INFILE "C/Users/felipe.espirito/Downloads/naranerd_vendedores.csv"
INTO TABLE vendedores 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_vendedor,nome,loja)


