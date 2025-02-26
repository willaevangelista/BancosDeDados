-- Criação de um banco de dados com nome db_farmacia_bem_estar
CREATE DATABASE db_farmacia_bem_estar;

-- Seleção do banco de dados db_farmacia_bem_estar
USE db_farmacia_bem_estar;

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
    descricao TEXT NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

  -- Inserção de 05 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Produtos para tratamento de doenças e condições de saúde.'),
('Cosméticos', 'Produtos para cuidados com a pele e beleza.'),
('Suplementos', 'Suplementos alimentares para melhorar a saúde e o bem-estar.'),
('Higiene', 'Produtos de higiene pessoal e cuidados diários.'),
('Farmacêuticos', 'Produtos relacionados à farmácia, como kits e materiais médicos.');

-- Inserção de 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, descricao, id_categoria) VALUES
('Aspirina 500mg', 25.00, 'Medicamento para dor de cabeça e febre.', 1),
('Creme Hidratante', 45.00, 'Creme para pele seca, hidratação intensa.', 2),
('Suplemento Vitaminas', 80.00, 'Suplemento com vitaminas A, C, D e E.', 3),
('Shampoo Anticaspa', 20.00, 'Shampoo para combate à caspa.', 4),
('Kit Primeiros Socorros', 60.00, 'Kit com curativos, esparadrapo e outros materiais de primeiros socorros.', 5),
('Perfume Feminino', 150.00, 'Perfume floral e fresco para uso diário.', 2),
('Suplemento Whey Protein', 130.00, 'Proteína para ganho de massa muscular.', 3),
('Sabonete Líquido', 10.00, 'Sabonete líquido para higiene diária.', 4);

-- Seleção de todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50;

-- Seleção de todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;

-- Seleção utilizando o LIKE de todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.id, p.nome AS produto_nome, p.preco, p.descricao AS produto_descricao, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT p.id, p.nome AS produto_nome, p.preco, p.descricao AS produto_descricao, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Cosméticos';







