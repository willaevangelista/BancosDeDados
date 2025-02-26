-- Criação de um banco de dados com nome db_generation_game_online
CREATE DATABASE db_generation_game_online;

-- Seleção do banco de dados db_generation_game_online
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE tb_classes 
( 
  id BIGINT AUTO_INCREMENT PRIMARY KEY,  
  nome VARCHAR(255) NOT NULL,  
  tipo_classe VARCHAR(100) NOT NULL,  
  habilidade_especial VARCHAR(255),
  descricao TEXT
);

-- Criação da tabela tb_personagens
CREATE TABLE tb_personagens 
( id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  poder_ataque INT NOT NULL,
  poder_defesa INT NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  id_classe BIGINT,
  FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);
  
  -- Inserção de 05 registros na tabela tb_classes
INSERT INTO tb_classes (nome, tipo_classe, habilidade_especial, descricao) 
VALUES 
('Guerreiro', 'Ataque', 'Espada Flamejante', 'Classe focada em combate corpo a corpo.'),
('Mago', 'Mágica', 'Feitiço de Fogo', 'Classe focada em ataques mágicos à distância.'),
('Arqueiro', 'Ataque', 'Flecha Venenosa', 'Classe especializada em ataques de longo alcance com arco e flecha.'),
('Cavaleiro', 'Defesa', 'Escudo Imbatível', 'Classe que defende ataques e protege aliados.'),
('Ladrão', 'Ataque', 'Furtividade', 'Classe ágil e sorrateira, especializada em ataques rápidos.');

-- Inserção de 8 registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, categoria, id_classe) 
VALUES 
('Ragnar', 2500, 1500, 'Melee', 1),
('Merlin', 3000, 800, 'Mágico', 2),
('Lina', 2200, 1000, 'Melee', 3),
('Arthur', 1800, 3000, 'Defesa', 4),
('Sylvia', 1200, 1300, 'Melee', 5),
('Eldrin', 2000, 1500, 'Mágico', 2),
('Thorne', 2100, 900, 'Melee', 3),
('Hector', 2500, 2000, 'Defesa', 4);

-- Seleção de todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque >= 2000;

-- Seleção de todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Seleção utilizando o LIKE de todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT p.id, p.nome AS personagem_nome, p.poder_ataque, p.poder_defesa, c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

-- Seleção utilizando o INNER JOIN unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica
SELECT p.id, p.nome AS personagem_nome, p.poder_ataque, p.poder_defesa, c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Mago';







