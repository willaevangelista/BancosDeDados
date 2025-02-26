-- Criação de um banco de dados com nome db_construindo_vidas
CREATE DATABASE db_construindo_vidas;

-- Seleção do banco de dados db_construindo_vidas
USE db_construindo_vidas;

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
    marca VARCHAR(255) NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

  -- Inserção de 05 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Hidráulica', 'Materiais para encanamento e redes de água.'),
('Elétrica', 'Fios, cabos e materiais elétricos em geral.'),
('Ferramentas', 'Ferramentas para construção e manutenção.'),
('Tintas', 'Tintas para pintura interna e externa.'),
('Acabamento', 'Materiais para finalização e decoração.');

-- Inserção de 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, quantidade_estoque, marca, id_categoria) VALUES
('Tubo PVC 50mm', 120.00, 30, 'Tigre', 1),
('Fio Elétrico 2,5mm', 95.00, 50, 'Sil', 2),
('Martelo de Borracha', 60.00, 15, 'Tramontina', 3),
('Lata de Tinta 18L', 250.00, 10, 'Suvinil', 4),
('Revestimento Cerâmico', 130.00, 20, 'PortoBello', 5),
('Chuveiro Elétrico 5500W', 150.00, 25, 'Lorenzetti', 2),
('Furadeira de Impacto', 300.00, 8, 'Bosch', 3),
('Cimento CP II 50kg', 80.00, 40, 'Votoran', 5);

-- Seleção de todos os produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE preco > 100;

-- Seleção de todos os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

-- Seleção utilizando o LIKE de todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.id, p.nome AS produto_nome, p.preco, p.quantidade_estoque, p.marca, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT p.id, p.nome AS produto_nome, p.preco, p.quantidade_estoque, p.marca, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Hidráulica';







