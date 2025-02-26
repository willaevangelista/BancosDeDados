-- Criação de um banco de dados com nome db_curso_da_minha_vida
CREATE DATABASE db_curso_da_minha_vida;

-- Seleção do banco de dados db_curso_da_minha_vida
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela tb_cursos
CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    carga_horaria INT NOT NULL,
    professor VARCHAR(255) NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

  -- Inserção de 05 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Programação', 'Cursos sobre linguagens de programação e desenvolvimento de software.'),
('Design', 'Cursos sobre design gráfico, UX/UI e edição de imagens.'),
('Marketing', 'Cursos sobre marketing digital, branding e estratégias de vendas.'),
('Negócios', 'Cursos sobre empreendedorismo, gestão e administração.'),
('Idiomas', 'Cursos para aprendizado de novas línguas.');

-- Inserção de 8 registros na tabela tb_cursos
INSERT INTO tb_cursos (nome, preco, carga_horaria, professor, id_categoria) VALUES
('Curso de Java Completo', 800.00, 40, 'Carlos Souza', 1),
('Fundamentos de Python', 600.00, 35, 'Mariana Lima', 1),
('Design Gráfico com Photoshop', 450.00, 25, 'Lucas Almeida', 2),
('Marketing Digital para Iniciantes', 550.00, 30, 'Ana Beatriz', 3),
('Gestão Empresarial', 700.00, 50, 'Fernando Silva', 4),
('Inglês para Negócios', 950.00, 60, 'Jessica Santos', 5),
('JavaScript Avançado', 650.00, 40, 'Roberto Mendes', 1),
('UX/UI Design para Web', 750.00, 45, 'Beatriz Rocha', 2);

-- Seleção de todos os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500;

-- Seleção de todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600 AND 1000;

-- Seleção utilizando o LIKE de todos os produtos que possuam a letra J no atributo nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias
SELECT c.id, c.nome AS curso_nome, c.preco, c.carga_horaria, c.professor, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT c.id, c.nome AS curso_nome, c.preco, c.carga_horaria, c.professor, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id
WHERE cat.nome = 'Idiomas';







