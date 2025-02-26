-- Criação de um banco de dados com nome db_pizzaria_legal
CREATE DATABASE db_pizzaria_legal;

-- Seleção do banco de dados db_pizzaria_legal
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela  tb_pizzas
CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
  
  -- Inserção de 05 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Vegetariana', 'Pizzas com ingredientes exclusivamente vegetais.'),
('Vegana', 'Pizzas sem produtos de origem animal.'),
('Sem Lactose', 'Pizzas sem lactose, adequadas para intolerantes.'),
('Sem Glúten', 'Pizzas sem glúten, adequadas para celíacos.'),
('Tradicional', 'Pizzas tradicionais, com ingredientes comuns.');

-- Inserção de 8 registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, preco, descricao, id_categoria) VALUES
('Pizza Margherita', 45.00, 'Pizza com molho de tomate, queijo e manjericão.', 1),
('Pizza Vegana', 52.00, 'Pizza com molho de tomate, cogumelos, pimentões e abobrinha.', 2),
('Pizza Sem Lactose', 55.00, 'Pizza com molho de tomate, queijo sem lactose e presunto.', 3),
('Pizza Sem Glúten', 60.00, 'Pizza com massa sem glúten, molho de tomate, queijo e calabresa.', 4),
('Pizza de Calabresa', 40.00, 'Pizza com molho de tomate, queijo e calabresa.', 5),
('Pizza de Frango', 48.00, 'Pizza com molho de tomate, queijo, frango e milho.', 5),
('Pizza de Chocolate', 70.00, 'Pizza doce com chocolate e morangos.', 2),
('Pizza de Quatro Queijos', 80.00, 'Pizza com quatro tipos de queijo: mussarela, gorgonzola, provolone e parmesão.', 5);

-- Seleção de todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45;

-- Seleção de todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- Seleção utilizando o LIKE de todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT tb_pizzas.id, tb_pizzas.nome, tb_pizzas.preco, tb_pizzas.descricao, tb_categorias.nome
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT tb_pizzas.id, tb_pizzas.nome, tb_pizzas.preco, tb_pizzas.descricao, tb_categorias.nome
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Vegetariana';







