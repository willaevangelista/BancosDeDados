-- Criação de um banco de dados com nome db_cidade_dos_vegetais
CREATE DATABASE db_cidade_dos_vegetais;

-- Seleção do banco de dados db_cidade_dos_vegetais
USE db_cidade_dos_vegetais;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    validade DATE NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

  -- Inserção de 05 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Frutas', 'Produtos frescos e naturais como maçã, banana e laranja.'),
('Legumes', 'Produtos como cenoura, batata e beterraba.'),
('Verduras', 'Folhosos como alface, couve e rúcula.'),
('Grãos', 'Produtos como arroz, feijão e quinoa.'),
('Orgânicos', 'Produtos cultivados sem agrotóxicos.');

-- Inserção de 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, quantidade_estoque, validade, id_categoria) VALUES
('Banana Nanica', 9.50, 50, '2025-05-10', 1),
('Maçã Fuji', 12.00, 40, '2025-04-15', 1),
('Cenoura', 7.80, 60, '2025-03-20', 2),
('Alface Crespa', 5.50, 30, '2025-02-28', 3),
('Feijão Preto', 55.00, 20, '2026-01-01', 4),
('Quinoa', 75.00, 15, '2026-06-30', 4),
('Tomate Orgânico', 80.00, 25, '2025-03-15', 5),
('Brócolis Orgânico', 65.00, 18, '2025-04-10', 5);

-- Seleção de todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50;

-- Seleção de todos os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50 AND 150;

-- Seleção utilizando o LIKE de todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT tb_produtos.id, tb_produtos.nome, tb_produtos.preco, tb_produtos.quantidade_estoque, tb_categorias.nome
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT tb_produtos.id, tb_produtos.nome, tb_produtos.preco, tb_produtos.quantidade_estoque, tb_categorias.nome
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome IN ('Frutas', 'Legumes');







